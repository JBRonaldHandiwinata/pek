import json
import asyncio
from aiokafka import AIOKafkaConsumer
from constant.cfg import *


async def consume(manager):
    loop = asyncio.get_event_loop()
    consumer = AIOKafkaConsumer(MSG_KAFKA_TOPIC, loop=loop, bootstrap_servers=KAFKA_SERVER)
    await consumer.start()
    try:
        async for msg in consumer:
            # consumed_message = json.loads(msg.value.decode("utf-8"))
            # print("original_msg: ", msg.value.decode("utf-8"))
            # print("Message: ", consumed_message['msg'])
            # print("dt sends: ", consumed_message['dt'])
            # print("manager: ", manager)
            await manager.send_msg(msg.value.decode("utf-8"))
    finally:
        await consumer.stop()



