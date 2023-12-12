function onLoadFunction() {
    getAllHomestays();
    getAllSpecialty();
}

function getAllHomestays() {
    var owner = getUserInfo().id;
    var url = "/seller";
    var data = {
        "actionType": "homestay",
        "action": "get_homestay",
        "username": owner
    };
    console.log(data);
    $.ajaxSettings.async = false;
    $.post(
        url,
        data,
        (res) => {
            console.log(JSON.stringify(res));
            console.log(res.resCode);
            var list = res.houseList;
            var html = "";
            if (list !== undefined && list !== null) {
                for (var i = 0; i < list.length; i++) {
                    var homestay = list[i];
                    html += `<div class="card-body pb-3 transaction-details d-flex flex-wrap justify-content-between align-items-center">`;
                    html += `    <div class="user-bx-2 me-3 mb-3">`;
                    html += `        <img src="${homestay.imageurl}"`;
                    html += `             class="rounded" alt="">`;
                    html += `            <div>`;
                    html += `                <h3 class="fs-20 font-w700">${homestay.house_name}</h3>`;
                    html += `                <span class="font-w400">${homestay.location}</span>`;
                    html += `            </div>`;
                    html += `    </div>`;
                    html += `    <div class="d-flex justify-content-between align-items-center">`;
                    html += `        <div class="me-3 mb-3">`;
                    html += `            <button type="button"`;
                    html += `                    class="btn btn-sm light btn-primary detail_homestay_button" data-id=${homestay.house_id}>`;
                    html += `                查看民宿内房间`;
                    html += `            </button>`;
                    html += `        </div>`;
                    html += `        <div class="me-3 mb-3">`;
                    html += `            <button type="button"`;
                    html += `                    class="btn btn-sm light btn-primary modify_homestay_button" data-id=${homestay.house_id}>`;
                    html += `                修改民宿信息`;
                    html += `            </button>`;
                    html += `        </div>`;
                    html += `        <div class="me-3 mb-3">`;
                    html += `            <button type="button"`;
                    html += `                    class="btn btn-sm btn-outline-danger delete_homestay_button" data-id=${homestay.house_id}>`;
                    html += `                下架民宿`;
                    html += `            </button>`;
                    html += `        </div>`;
                    html += `    </div>`;
                    html += `</div>`;
                }
                $("#homestay_list").html(html);
                initHomestayButtons();
            }
        }
    )
    $.ajaxSettings.async = true;
}

function initHomestayButtons() {
    var detailButtons = document.querySelectorAll(".detail_homestay_button");
    for (var i = 0; i < detailButtons.length; i++) {
        var button = detailButtons[i];
        button.addEventListener("click", (e) => {
            var homestayId = e.target.dataset.id;
            console.log(homestayId);
            window.location.href = `/seller/house_detail.jsp?house_id=${homestayId}`;
        })
    }

    var deleteButtons = document.querySelectorAll(".delete_homestay_button");
    for (var i = 0; i < deleteButtons.length; i++) {
        var button = deleteButtons[i];
        button.addEventListener("click", (e) => {
            var homestayId = e.target.dataset.id;
            showDeleteHomestayModal(homestayId);
        })
    }

    var modifyButtons = document.querySelectorAll(".modify_homestay_button");
    for (var i = 0; i < modifyButtons.length; i++) {
        var button = modifyButtons[i];
        button.addEventListener("click", (e) => {
            var homestayId = e.target.dataset.id;
            showModifyHomestayModal(homestayId);
        })
    }
}

function showDeleteHomestayModal(homestayId) {
    console.log(homestayId);
    $("#deleteHomestayModalCenter #deleteHomestayConfirmButton").click((e) => {
        var url = "/seller";
        var data = {
            "actionType": "homestay",
            "action": "delete_homestay",
            "house_id": homestayId
        };
        $.post(
            url,
            data,
            (res) => {
                console.log(res.resCode);
                if (res.resCode === "00000") {
                    location.reload();
                }
            }
        )
    })
    $("#deleteHomestayModalCenter").modal("show");
}

function showModifyHomestayModal(homestayId) {
    console.log(homestayId);
    getHomestayById(homestayId);
    $("#modifyHomestayModelCenter #modifyHomestayConfirmButton").click((e) => {
        geoCode();
        var url = "/seller";
        var homestayName = $("#modify_homestay_name").val();
        var location = $("#modify_location").val();
        var lnglat = $("#modify_lnglat").val().split(",");
        var longitude = lnglat[0];
        var latitude = lnglat[1];
        var data = {
            "actionType": "homestay",
            "action": "modify_homestay",
            "house_id": homestayId,
            "house_name": homestayName,
            "longitude": longitude,
            "latitude": latitude,
            "location": location,
            "imageurl": document.querySelector("#modify_homestay_image_preview > img").src
        };
        // 去除 data:image/*;base64, 的前缀
        data.imageurl = data.imageurl.substring(data.imageurl.indexOf(",") + 1);
        console.log(data);
        $.post(
            url,
            data,
            (res) => {
                console.log(res.resCode);
                if (res.resCode === "00000") {
                    window.location.reload();
                }
            }
        )
    })
    $("#modifyHomestayModelCenter").modal("show");
}

function getHomestayById(homestayId) {
    var url = "/seller";
    var data = {
        "actionType": "homestay",
        "action": "get_homestay",
        "house_id": homestayId
    };
    console.log(data);
    $.post(
        url,
        data,
        (res) => {
            console.log(res.resCode);
            if (res.resCode === "00000") {
                var house = res.house;
                $("#modify_homestay_name").val(house.house_name);
                $("#modify_location").val(house.location);
                $("#modify_lnglat").val(house.latitude + "," + house.longitude);
                document.querySelector("#modify_homestay_image_preview > img").src = house.imageurl;
            }
        }
    )
}

$("#modify_homestay_image").change((input_event) => {
    var file = input_event.target.files[0];
    console.log(file);
    if (file !== undefined && file !== null) {
        var reader = new FileReader();
        reader.addEventListener("load", (reader_event) => {
            document.querySelector("#modify_homestay_image_preview > img").src = reader_event.target.result;
        })
        reader.readAsDataURL(file);
        document.querySelector("#modify_homestay_image").value = "";
    }
})

function getAllSpecialty() {
    var owner = getUserInfo().id;
    var url = "/seller";
    var data = {
        "actionType": "specialty",
        "action": "get_specialty",
        "username": owner
    };
    $.ajaxSettings.async = false;
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
                    html += `<div class="col-xl-4">`;
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
                    html += `                <button class="btn btn-primary btn-sm light modify_specialty_button">修改商品信息</button>`;
                    html += `                <button class="btn btn-outline-danger btn-sm light delete_specialty_button">下架商品</button>`;
                    html += `            </div>`;
                    html += `            <input type="hidden" value="${specialty.specialty_id}" class="specialty_id">`;
                    html += `        </div>`;
                    html += `</div>`;
                    html += `</div>`;
                }
                $("#specialty_list").html(html);
            }
        }
    )
    $.ajaxSettings.async = true;
    initSpecialtyButtons();
}

function initSpecialtyButtons() {
    var deleteButtons = document.querySelectorAll(".delete_specialty_button");
    for (var i = 0; i < deleteButtons.length; i++) {
        var button = deleteButtons[i];
        button.addEventListener("click", (e) => {
            var specialtyId = e.currentTarget.parentNode.nextElementSibling.value;
            showDeleteSpecialtyModal(specialtyId);
        });
    }

    var modifyButtons = document.querySelectorAll(".modify_specialty_button");
    for (var i = 0; i < modifyButtons.length; i++) {
        var button = modifyButtons[i];
        button.addEventListener("click", (e) => {
            var specialtyId = e.currentTarget.parentNode.nextElementSibling.value;
            showModifySpecialtyModal(specialtyId);
        });
    }
}

function showDeleteSpecialtyModal(specialtyId) {
    $("#deleteSpecialtyModalCenter #deleteSpecialtyConfirmButton").click((e) => {
        var url = "/seller";
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
                if (res.resCode === "00000") {
                    location.reload();
                }
            }
        )
    });
    $("#deleteSpecialtyModalCenter").modal("show");
}

function showModifySpecialtyModal(specialtyId) {
    getSpecialtyByID(specialtyId);
    $("#modifySpecialtyModelCenter #modifySpecialtyConfirmButton").click((e) => {
        var url = "/seller";
        console.log(specialtyId);
        var data = {
            "actionType": "specialty",
            "action": "modify_specialty",
            "specialty_id": specialtyId,
            "specialty_name": $("#modify_specialty_name").val(),
            "price": $("#modify_specialty_price").val(),
            "num": $("#modify_specialty_num").val(),
            "imageurl": document.querySelector("#modify_specialty_image_preview > img").src
        };
        // 去除 data:image/*;base64, 的前缀
        data.imageurl = data.imageurl.substring(data.imageurl.indexOf(",") + 1);
        console.log(data);
        $.post(
            url,
            data,
            (res) => {
                console.log(JSON.stringify(res));
                if (res.resCode === "00000") {
                    location.reload();
                }
            }
        )
    })
    $("#modifySpecialtyModelCenter").modal("show");
}

function getSpecialtyByID(specialtyId) {
    var url = "/seller";
    console.log(specialtyId);
    var data = {
        "actionType": "specialty",
        "action": "get_specialty",
        "specialty_id": specialtyId
    };
    $.post(
        url,
        data,
        (res) => {
            console.log(JSON.stringify(res));
            if (res.resCode === "00000") {
                var specialty = res.specialty;
                $("#modify_specialty_name").val(specialty.specialty_name);
                $("#modify_specialty_price").val(specialty.price);
                $("#modify_specialty_num").val(specialty.num);
                document.querySelector("#modify_specialty_image_preview > img").src = specialty.imageurl;
            }
        }
    )
}

$("#modify_specialty_image").change((input_event) => {
    var file = input_event.target.files[0];
    console.log(file);
    if (file !== undefined && file !== null) {
        var reader = new FileReader();
        reader.addEventListener("load", (reader_event) => {
            document.querySelector("#modify_specialty_image_preview > img").src = reader_event.target.result;
        })
        reader.readAsDataURL(file);
        document.querySelector("#modify_specialty_image").value = "";
    }
})