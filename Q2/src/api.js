const express = require('express')
const app = express()
const msgs = ["Hello", "Welcome", "Insurance", "Bowtie"]
const maxDepth = 2 //Limits the max depth of the json tree

app.get('/', function (req, res) {
  res.set('Access-Control-Allow-Origin', '*')
  res.json(genElement("box", Math.ceil(Math.random() * 4), maxDepth))
})


function genColour () {
  return '#' + Math.floor(Math.random()*16777215).toString(16); //generates a random colour hex
}

function randomMsg () {

  return msgs[Math.floor(Math.random() * (msgs.length - 1))]

}

function pickType () {

  return Math.random() >= 0.5 ? "box" : "text"

}

function genElement (type, children, maxDepth) {

  let elem = {"type": type,
              "message": randomMsg()
  }

  if (type === "box") {
    let cArray = [] //to hold children

    if (maxDepth != 0) {
    for (let i = 0; i <= children - 1; i++) {
      cArray[i] = genElement(pickType(), 2, maxDepth - 1)
        }
      
      }

    elem = {...elem, 
              "background": genColour(),
              "children": cArray
        }
  } 

return elem
}

console.log("Listening on port 3000...")

app.listen(3000)