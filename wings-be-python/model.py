from sqlalchemy import Boolean, Column, ForeignKey, Integer, String, Numeric, DateTime
from sqlalchemy.orm import relationship

from main import Base


class Login(Base):
    __tablename__ = "login"

    username = Column(String,primary_key=True)
    password = Column(String)

class Product(Base):
    __tablename__ = "product"

    productcode = Column(String,primary_key=True)
    productname = Column(String)
    price = Column(Numeric)
    currency = Column(String)
    discount = Column(Numeric)
    dimension = Column(String)
    unit = Column(String)

class TransactionHeader(Base):
    __tablename__ = "transactionheader"

    documentcode = Column(String,primary_key=True)
    documentnumber = Column(String)
    username = Column(String)
    total = Column(Numeric)
    date = Column(DateTime)

class TransactionDetail(Base):
    __tablename__ = "transactiondetail"

    documentcode = Column(String,primary_key=True)
    documentnumber = Column(String)
    productcode = Column(String)
    price = Column(Numeric)
    quantity = Column(Integer)
    username = Column(String)
    subtotal = Column(Numeric)
    currency = Column(String)

