from pydantic import BaseModel, Field


class RegMsg(BaseModel):
    msg_txt: str = Field(..., example='hello world')
