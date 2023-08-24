// import logo from './logo.svg';
import React, { useState, useEffect } from "react";
import './App.css';

function App() {

  const [websckt, setWebsckt] = useState();
  const [messages, setMessages] = useState([]);

  useEffect(() => {
    // const url = "ws://127.0.0.1:2024/ws";
    const url = "ws://103.41.205.80:2024/ws";
    const ws = new WebSocket(url);

    ws.onopen = (event) => {
      ws.send("Connect");
    };

    // recieve message every start page
    ws.onmessage = (e) => {
      const message = JSON.parse(e.data);
      setMessages([...messages, message]);
    };

    setWebsckt(ws);
    //clean up function when we close page
    // return () => ws.close();
    return () => {
      if(ws.readyState === 1){
        ws.close();
      }
    }
  }, []);

  return (
    <div className="App">
      <header className="App-header">

        <p>PeK Automotive: </p>
        {messages.map((value, index) => {
          return(
            <div key={index}>
              <div className="message">Message: {value.msg}</div>
              <div className="message">Received at: {value.dt}</div>
            </div>
          )
       })}


      </header>
      
    </div>
  );
}

export default App;
