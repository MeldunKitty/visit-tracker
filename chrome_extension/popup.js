function extractDomain(url) {
    var domain;

    if (url.indexOf("//") > -1) {
        domain = url.split('/')[2];
    }
    else {
        domain = url.split('/')[0];
    }

    if (url.indexOf("www.") > -1) {
        domain = url.split('www.')[1];
    }

    domain = domain.split(':')[0];
    domain = domain.split('?')[0];
    domain = domain.split('/')[0];

    return domain;
}
chrome.tabs.query({'active': true, 'lastFocusedWindow': true}, function (tabs) {
    let current_url = extractDomain(tabs[0].url);
    let el = document.getElementById("current_url");
    el.innerHTML = current_url;
});