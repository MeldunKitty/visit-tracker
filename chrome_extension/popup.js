fetch('https://localhost/api/visits', {
    method: 'get',
}).then(function (response) {
    let el = document.getElementById("status");
    el.innerHTML = 'OK';
    el.style.color = 'green';
}).catch(function (error) {
    let el = document.getElementById("status");
    el.innerHTML = 'FAIL';
    el.style.color = 'red';
});