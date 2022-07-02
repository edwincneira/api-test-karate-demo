function fn() {

    var config = {
        apiUrl:
            'https://reqres.in'
    };

    config.suma = function(number1, number2) {
        return number1 + number2
    }

    return config;
}
