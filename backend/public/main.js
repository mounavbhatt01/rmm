async function getSearchResults(event) {
    const api = "/api"
    fetch(api,
        {
            method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ "zipcode": document.querySelector("#zipcode").value })
        })
        .then(async (data) => {
            document.querySelector(".results").innerHTML = await data.text();
        })
        .catch(error => console.log(error));
}