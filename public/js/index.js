function getViews() {
    // Http request to server
    let request = new XMLHttpRequest();
    request.open("get", "/views/index");
    console.log("YEET")
    // XML Http Requests are asynchronous and therefore need a 
    // callback function
    request.onreadystatechange = function() {
        console.log(request);
        // Check if the request was completed
        if (request.readyState === 4) {
            // Check if the status code from the server equals success
            if (request.status === 200) {
                let response = request.response;
            }
        }
    }

    request.send();
}

getViews();
