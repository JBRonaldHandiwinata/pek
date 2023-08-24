import uvicorn
from fastapi import FastAPI, WebSocket, WebSocketDisconnect
from fastapi.middleware.cors import CORSMiddleware

from helper.ws_manager import WsManager
from helper.receiver import consume


app = FastAPI(debug=True)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)


@app.websocket("/ws")
async def ws(websocket: WebSocket):
    manager = WsManager()
    await manager.connect(websocket)
    try:
        while True:
            await consume(manager)
    except WebSocketDisconnect:
        manager.disconnect(websocket)


if __name__ == "__main__":
    uvicorn.run(app="web_api:app", host="0.0.0.0", port=2024, workers=4, reload=True)

