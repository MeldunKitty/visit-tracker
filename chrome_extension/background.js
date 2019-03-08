// send information to the server about the current tab when it is updated
chrome.tabs.onUpdated.addListener(function (tabId, changeInfo, tab) {

    // we need a complete update + ignore chrome pages
    if (changeInfo.status === 'complete' && tab.url.indexOf("chrome://") === -1){

        let form_data = new FormData();
        form_data.append('url', tab.url);

        fetch('https://localhost/api/visits', {
            method: 'post',
            body: form_data
        }).then(function (response) {
            console.log(response);
        }).catch(function (error) {

        });
    }
});

