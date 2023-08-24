import uvicorn
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routers import msg


app = FastAPI(debug=True)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)

app.include_router(
    router=msg.router,
    prefix='/msg',
    tags=['msg'],
    responses={404: {'message': 'Not Found'}},
    # dependencies=[Depends(AuthHelper.get_current_active_user)]
)

if __name__ == "__main__":
    uvicorn.run(app="mobile_api:app", host="0.0.0.0", port=2023, workers=4, reload=True)

