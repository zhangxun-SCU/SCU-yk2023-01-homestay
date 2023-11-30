function onLoadFunction() {
    getAllSpecialty();
}

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

function getAllSpecialty() {
    var owner = "xun";
    var url = "/stay/seller";
    var data = {
        "actionType": "specialty",
        "action": "get_specialty",
        "username": owner
    };
    $.post(
        url,
        data,
        (res) => {
            console.log(JSON.stringify(res));
            console.log(res.resCode);
            var list = res.specialtyList;
            var html = "";
            if (list !== undefined && list !== null) {
                for (var i = 0; i < list.length; i++) {
                    var specialty = list[i];
                    html += `<div class="col-xl-6">`;
                    html += `<div class="card">`;
                    html += `        <img src="${specialty.imageurl}" alt="${specialty.specialty_name}" class="card-img-top img_preview">`;
                    html += `        <div class="card-header border-0 pb-0">`;
                    html += `            <h5 class="card-title">${specialty.specialty_name}</h5>`;
                    html += `        </div>`;
                    html += `        <div class="card-body">`;
                    html += `            <p class="card-text">`;
                    html += `            </p>`;
                    html += `        </div>`;
                    html += `        <div class="card-footer border-0 pt-0">`;
                    html += `            <p class="card-text d-inline">&yen;${specialty.price} 剩余${specialty.num}件</p>`;
                    html += `            <div class="float-end">`;
                    html += `                <button class="btn btn-primary btn-sm modify_specialty_button">修改商品信息</button>`;
                    html += `                <button class="btn btn-outline-danger btn-sm delete_specialty_button">下架商品</button>`;
                    html += `            </div>`;
                    html += `            <input type="hidden" value="${specialty.specialty_id}" class="specialty_id">`;
                    html += `        </div>`;
                    html += `</div>`;
                    html += `</div>`;
                }
                $("#specialty_list").html(html);
                initButtons();
            }
        }
    )
}

function initButtons() {
    var deleteButtons = document.querySelectorAll(".delete_specialty_button");
    for (var i = 0; i < deleteButtons.length; i++) {
        var button = deleteButtons[i];
        button.addEventListener("click", deleteSpecialty);
    }

    var modifyButtons = document.querySelectorAll(".modify_specialty_button");
    for (var i = 0; i < modifyButtons.length; i++) {
        var button = modifyButtons[i];
        button.addEventListener("click", modifySpecialty);
    }
}

function deleteSpecialty(e) {
    var url = "/stay/seller";
    var specialtyId = e.currentTarget.parentNode.nextElementSibling.value;
    console.log(specialtyId);
    var data = {
        "actionType": "specialty",
        "action": "delete_specialty",
        "specialty_id": specialtyId
    };
    $.post(
        url,
        data,
        (res) => {
            console.log(JSON.stringify(res));
        }
    )
}

function modifySpecialty(e) {
    var url = "/stay/seller";
    var specialtyId = e.currentTarget.parentNode.nextElementSibling.value;
    console.log(specialtyId);
    var data = {
        "actionType": "specialty",
        "action": "modify_specialty",
        "specialty_id": specialtyId
    };
}