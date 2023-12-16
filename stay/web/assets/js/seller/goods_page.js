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
    var url = "/seller";
    var data = {
        "actionType": "specialty",
        "action": "add_specialty",
        "username": getUserInfo().id,
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
            if (res.resCode === "00000") {
                new Promise((resolve, reject) => {
                    swal(
                        "成功！",
                        "您成功添加一件商品！",
                        "success"
                    )
                    resolve("ok");
                }).then((_) => {
                    window.location.reload();
                })
            }
        }
    )
})

$("#homestay_image").change((input_event) => {
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
        document.querySelector("#homestay_image").value = "";
    }
})

$("#add_homestay_button").click((e) => {
    console.log("add homestay");
    var url = "/seller";
    var lnglat = $("#homestay_lnglat").val();
    var longitude = lnglat.split(",")[0];
    var latitude = lnglat.split(",")[1];
    var homestayName = $("#homestay_name").val();
    var homestayLocation = $("#homestay_location").val();
    if (isNull(homestayName)) {
        showWarningModal("请输入正确的民宿名称");
    } else if (isNull(homestayLocation) || isNull(lnglat)) {
        showWarningModal("请选择民宿的地址");
    } else {
        var data = {
            "actionType": "homestay",
            "action": "add_homestay",
            "username": getUserInfo().id,
            "house_name": homestayName,
            "location": homestayLocation,
            "longitude": longitude,
            "latitude": latitude
        };
        var img_list = document.querySelectorAll("div:has(> label#homestay_image_preview) > .img_box > img");
        data.imageurl = img_list[0].src;
        // 去除 data:image/*;base64, 的前缀
        data.imageurl = data.imageurl.substring(data.imageurl.indexOf(",") + 1);
        $.post(
            url,
            data,
            (res) => {
                console.log(JSON.stringify(res));
                if (res.resCode === "00000") {
                    new Promise((resolve, reject) => {
                        swal(
                            "成功！",
                            "您成功添加一间民宿",
                            "success"
                        )
                        resolve("ok");
                    }).then((_) => {
                        window.location.reload();
                    })
                }
            }
        )
    }
})

function isNull(str) {
    return str === undefined || str === null || str === "";
}
