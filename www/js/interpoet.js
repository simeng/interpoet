window.onload = function () {
    var SpeechRecognition = window.webkitSpeechRecognition || window.mozSpeechRecognition || window.SpeechRecognition || undefined;
    if (typeof(SpeechRecognition) == "undefined") {
        alert("Sorry, Chrome is the only browser that has implemented SpeechRecognition");
        return;
    }

    document.querySelector(".record").onclick = function (evt) {
        console.log("ACTIVATED");
        var result = document.querySelector(".result");
        var iresult = document.querySelector(".iresult");
        var recognition = new SpeechRecognition();

        var transcript = '';
        var itranscript = '';

        recognition.continuous = true;
        recognition.interimResults = true;

        recognition.onstart = function () {
            console.log("Starting");
        };
        recognition.onresult = function (evt) {
            var node = document.createElement("p");
            var inode = document.createElement("p");
            transcript = '';
            itranscript = '';

            for (var i in evt.results) {
                if (evt.results[i][0]) {
                    if (evt.results[i].isFinal)
                        transcript += evt.results[i][0].transcript;
                    else
                        itranscript += evt.results[i][0].transcript;
                }
            }
            result.innerHTML = transcript;

            iresult.innerHTML = itranscript;
        };
        recognition.onerror = function (evt) {
            console.log("ERROR");
            console.log(evt);
        };
        recognition.onend = function () {
        };

        recognition.start();
    };
};
