function validate() {
    var inputNodes = document.getElementsByTagName('input');

    for (var item in inputNodes) {
        if (inputNodes[item].getAttribute('type') == 'text') {
            if (inputNodes[item].value.trim() == '') {
                alert('Enter all values');
                return false;
            }
        }
    }
    return true;
}