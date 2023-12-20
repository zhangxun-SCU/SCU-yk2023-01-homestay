function onLoadFunction() {
    getAllRooms();
}

function getHouseId() {
    var regex = new RegExp("house\_id=\\w*");
    var matchRes = window.location.href.match(regex);
    if (matchRes.length > 0) {
        var houseId = matchRes[0];
        houseId = houseId.substring(houseId.indexOf("=") + 1);
    }
    return houseId;
}

$("#addRoomButton").click((e) => {
    var house_id = e.target.dataset.id;
    $("#addRoomModalCenter #addRoomConfirmButton").click((event) => {
        var username = getUserInfo().id;
        var room_name = $("#add_room_name").val();
        var room_price = $("#add_room_price").val();
        var room_num = $("#add_room_num").val();
        var imageurl = document.querySelector("#add_room_image_preview > img").src;
        imageurl = imageurl.substring(imageurl.indexOf(",") + 1);
        var url = "/seller";
        var data = {
            "actionType": "room",
            "action": "add_room",
            "house_id": house_id,
            "room_name": room_name,
            "room_price": room_price,
            "room_num": room_num,
            "imageurl": imageurl
        };
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
    $("#addRoomModalCenter").modal("show");
})

function getAllRooms() {
    var url = "/seller";
    var house_id = getHouseId();
    console.log(house_id)
    var data = {
        "actionType": "room",
        "action": "get_room",
        "house_id": house_id
    };
    $.ajaxSettings.async = false;
    $.post(
        url,
        data,
        (res) => {
            console.log(res.resCode);
            if (res.resCode === "00000") {
                var roomList = res.roomList;
                var html = "";
                console.log(roomList);
                for (var i = 0; i < roomList.length; i++) {
                    var room = roomList[i];
                    html += `<div class="card-body pb-3 transaction-details d-flex flex-wrap justify-content-between align-items-center">`;
                    html += `    <div class="user-bx-2 me-3 mb-3">`;
                    html += `        <img src="${room.imageurl}"`;
                    html += `             class="rounded"`;
                    html += `             alt="${room.room_name}">`;
                    html += `            <div>`;
                    html += `                <h3 class="fs-20 font-w700">${room.room_name}</h3>`;
                    html += `                <span class="font-w400 price">&yen;${room.room_price}</span>`;
                    html += `                <span class="font-w400 text-muted">剩余${room.room_num}间</span>`
                    html += `            </div>`;
                    html += `    </div>`;
                    html += `    <div class="d-flex justify-content-between align-items-center">`;
                    html += `        <div class="me-3 mb-3">`;
                    html += `            <button type="button" class="btn btn-sm light btn-primary modify_room_button"`;
                    html += `                    data-id="${room.room_id}">`;
                    html += `                修改房间信息`;
                    html += `            </button>`;
                    html += `        </div>`;
                    html += `        <div class="me-3 mb-3">`;
                    html += `            <button type="button" class="btn btn-sm btn-outline-danger delete_room_button"`;
                    html += `                    data-id="${room.room_id}">`;
                    html += `                删除房间`;
                    html += `            </button>`;
                    html += `        </div>`;
                    html += `    </div>`;
                    html += `</div>`;
                }
                $("#room_list").html(html);
            }
        }
    )
    $.ajaxSettings.async = true;
    initRoomButtons();
}

function initRoomButtons() {
    $(".modify_room_button").click((e) => {
        var houseId = getHouseId();
        var roomId = e.target.dataset.id;
        showModifyRoomModal(houseId, roomId);
    })

    $(".delete_room_button").click((e) => {
        var houseId = getHouseId();
        var roomId = e.target.dataset.id;
        showDeleteRoomModal(houseId, roomId);
    })
}

function showModifyRoomModal(houseId, roomId) {
    getRoomById(houseId, roomId);
    $("#modifyRoomModelCenter #modifyRoomConfirmButton").click((e) => {
        var url = "/seller";
        var data = {
            "actionType": "room",
            "action": "modify_room",
            "house_id": houseId,
            "room_id": roomId,
            "room_name": $("#modify_room_name").val(),
            "room_num": $("#modify_room_num").val(),
            "room_price": $("#modify_room_price").val(),
        };
        var imageurl = document.querySelector("#modify_room_image_preview > img").src;
        if (imageurl.indexOf(",") !== -1) {
            data.imageurl = imageurl.substring(imageurl.indexOf(",") + 1);
        }
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
    $("#modifyRoomModelCenter").modal("show");
}

function getRoomById(houseId, roomId) {
    var url = "/seller";
    var data = {
        "actionType": "room",
        "action": "get_room",
        "house_id": houseId,
        "room_id": roomId
    };
    $.ajaxSettings.async = false;
    $.post(
        url,
        data,
        (res) => {
            console.log(res.resCode);
            if (res.resCode === "00000") {
                var room = res.room;
                $("#modify_room_name").val(room.room_name);
                $("#modify_room_num").val(room.room_num);
                $("#modify_room_price").val(room.room_price);
                document.querySelector("#modify_room_image_preview > img").src = room.imageurl;
            }
        }
    )
    $.ajaxSettings.async = true;
}

function showDeleteRoomModal(houseId, roomId) {
    $("#deleteRoomModalCenter #deleteRoomConfirmButton").click((e) => {
        var url = "/seller";
        var data = {
            "actionType": "room",
            "action": "delete_room",
            "house_id": houseId,
            "room_id": roomId
        };
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
    $("#deleteRoomModalCenter").modal("show");
}


