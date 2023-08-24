import json
import asyncio
from fastapi import APIRouter
from aiokafka import AIOKafkaProducer
from dto.msg_dto import RegMsg
from constant.cfg import *
from utils.misc import *

router = APIRouter()


@router.post("/send", description="Endpoint for Mobile send message")
async def send_msg(req: RegMsg):
    loop = asyncio.get_event_loop()
    producer = AIOKafkaProducer(loop=loop, bootstrap_servers=KAFKA_SERVER)
    await producer.start()
    try:
        await producer.send_and_wait(topic=MSG_KAFKA_TOPIC,
                                     value=json.dumps(dict(msg=req.msg_txt, dt=current_dt())).encode("utf-8"))
    finally:
        await producer.stop()
    return response()
