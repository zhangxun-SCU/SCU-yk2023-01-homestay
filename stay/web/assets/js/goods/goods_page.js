$("#specialty_image").change((input_event) => {
    var file = input_event.target.files[0];
    console.log(input_event.target.files);
    if (file !== null && file !== undefined) {
        var reader = new FileReader();
        reader.addEventListener("load", (reader_event) => {
            var img_box = document.createElement("div");
            var img = document.createElement("img");
            var hint = document.createElement("h3");
            hint.innerText = "Remove";
            hint.classList.add("hint")
            img.src = reader_event.target.result;
            var father_div = input_event.currentTarget.parentNode;
            img_box.appendChild(img);
            img_box.appendChild(hint);
            img_box.classList.add("img_box");
            father_div.appendChild(img_box);
            img_box.onclick = (e) => {
                father_div.removeChild(img_box);
            }
        })
        reader.readAsDataURL(file);
        document.querySelector("#specialty_image").value = "";
    }
})

$("#add_specialty_button").click((e) => {
    var url = "/stay/seller";
    console.log(url);
    // TODO: 怎么知道是哪个用户上架的商品呢？
    var data = {
        "actionType": "specialty",
        "action": "add_specialty",
        "username": "xun",
        "specialty_name": $("#specialty_name").val(),
        "price": $("#specialty_price").val(),
        "num": $("#specialty_num").val(),
    };
    var img_list = document.querySelectorAll("div:has(> label#specialty_image_preview) > .img_box > img");
    data.imageurl = img_list[0].src;
    // 去除 data:image/*;base64, 的前缀
    data.imageurl = data.imageurl.substring(data.imageurl.indexOf(",") + 1);
    $.post(
        url,
        data,
        (res) => {
            console.log(JSON.stringify(res));
        }
    )
})