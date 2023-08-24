import time
from datetime import datetime
from fastapi.responses import JSONResponse
from constant.rcval import *


def current_dt():
    return datetime.fromtimestamp(time.time()).strftime('%Y-%m-%d %H:%M:%S')


def response(rc: str = RC_SUCCESS):
    msg = RCMSG_ID[rc]
    return JSONResponse(default_response(msg, rc))


def default_response(msg, rc):
    return {
        'rc': rc,
        'msg': msg,
    }
