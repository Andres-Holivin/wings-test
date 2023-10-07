import string
from datetime import date
from random import random
from typing import Union, List

import uvicorn
from fastapi import FastAPI, Depends
from psycopg2 import Date
from pydantic import BaseModel
from sqlalchemy import create_engine, null
from sqlalchemy.orm import sessionmaker, declarative_base, Session

import model

app = FastAPI(debug=True, version="0.1.0")

SQLALCHEMY_DATABASE_URL = "postgresql://postgres:secret@localhost/penjualan"

engine = create_engine(
    SQLALCHEMY_DATABASE_URL
)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


class User(BaseModel):
    username: str
    password: str


@app.post("/users/")
def read_users(user: User, db: Session = Depends(get_db)):
    users = db.query(model.Login).filter(model.Login.username == user.username).first()
    print(users)
    if users != null and users.password == user.password:
        return users

    return


@app.get("/product/")
def read_users(db: Session = Depends(get_db)):
    users = db.query(model.Product).all()
    return users


class TransactionProduct(BaseModel):
    code: str
    price: int
    qty: int


class Transaction(BaseModel):
    username: str
    product: List[TransactionProduct]


@app.post("/transaction")
def read_users(transaction: Transaction, db: Session = Depends(get_db)):
    doc_code = ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(3))
    doc_num = random.randint(pow(10, 3 - 1), pow(10, 3) - 1)

    trans_header = model.TransactionHeader(documentcode=doc_code, documentnumber=doc_code,
                                           username=transaction.username,
                                           date=date.today())
    trans_detail = model.TransactionDetail(documentcode=doc_code, documentnumber=doc_code,
                                           productcode=transaction.username,
                                           date=date.today())
    db.add(trans_header)
    # return users


if __name__ == '__main__':
    uvicorn.run(
        "__main__:app",
        host="0.0.0.0",
        port=8000,
        reload=True
    )
