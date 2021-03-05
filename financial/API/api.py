from flask import Flask, json
import pymongo
import numpy as np

api = Flask(__name__)

def mongo_connection():
    client = pymongo.MongoClient("mongodb://192.168.1.135:27017/")
    return client

@api.route('/companies', methods=['GET'])
def get_usa_tickers():
    client = mongo_connection()
    financialDB = client['financialDB']
    tickers_dict = financialDB['usa_tickers'].find({}, {'_id': 0})
    # as tickers_dict is a Cursor (iterable),
    # tenemos que devolver una lista de diccionarios
    tickers_list = [change_NaN(d) for d in tickers_dict]
    return json.dumps({'results':tickers_list[:20]})

def change_NaN(dictionary):
    final_d = {}
    for d in dictionary:
        if type(dictionary[d]) is float and np.isnan(dictionary[d]):
            final_d[d] = ''
        else:
            final_d[d] = dictionary[d]
    return final_d

if __name__ == '__main__':
    api.run(port = '8000')
