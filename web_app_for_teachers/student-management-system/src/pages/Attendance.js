import React from "react";
import NavBar from "../components/NavBar";
import Spreadsheet from "react-spreadsheet";
import { useState, useEffect } from "react";
import "./Attendance.css";

 
export default function Attendace() {

    var sheetData = [      
        [{}, {}, {}, {}, {}, {}, {}, {}],  

        [{value: "Name of the Student"}, {},{ value: "1st Week" }, { value: "2nd Week" }, {value: "3rd Week"}, 
            {value: "4th Week"}, {value: "5th Week"}, {value: "No of Attendance"}],

        [{}, {}, {}, {}, {}, {}, {}, {}],    
        [{value: "Rusiru"}, {}, { value: true }, { value: "Sick" }, { value: true }, {}, {}, {}],  
        [{value: "Heshan"}, {}, { value: true }, { value: true }, { value: false }],
        [{value: "Dinindu"}, {}, { value: true }, { value: true }, { value: false }],
        [{}, {}, {}, {}, {}, {}, {}, {}],
        [{}, {}, {}, {}, {}, {}, {}, {}],

    ];
    const [data, setData] = useState(sheetData); 
    const [clicked, setClicked] = useState(false);

    function appendRow() {
        sheetData.push([{},{},{}]);
        setData(sheetData);
    }

    useEffect(() => {
        appendRow();
    }, [clicked]);
        
    return (
        <div>
            <NavBar/>
            <div className="page-name">
                Students' Attendance
            </div>
            
            <Spreadsheet data={data} onChange={setData} />

            <div>
                <button onClick={() => setClicked(!clicked)}> + New </button>
            </div>

        </div>
    )
}