<%@ page import="homestay.utils.UserUtil" %>
<%@ page import="homestay.dao.UserDao" %>
<%@ page import="homestay.entity.User" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.json.JSONException" %>
<%--
  Created by IntelliJ IDEA.
  User: cw
  Date: 2023/12/10
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 获取用户信息
    String userId = UserUtil.getUserId(request);
    UserDao userDao = new UserDao();
    User user = null;
    try {
        user = userDao.queryUserByKey("user_id", userId);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    } catch (JSONException e) {
        throw new RuntimeException(e);
    }

    String userType = "";
    if(user.permission.equals("low")) {
        userType = "普通用户";
    } else if(user.permission.equals("middle")) {
        userType = "商家用户";
    } else if(user.permission.equals("superhigh")) {
        userType = "super manager";
    }
%>

<div class="nav-header">
    <a href="/index.html" class="brand-logo">
        <svg class="logo-abbr" width="57" height="57" viewBox="0 0 57 57" fill="none"
             xmlns="http://www.w3.org/2000/svg">
            <path d="M32.9585 1.84675C30.4961 -0.615584 26.5039 -0.615585 24.0415 1.84675L19.3876 6.50068H12.8059C9.32365 6.50068 6.50071 9.32362 6.50071 12.8059V19.3876L1.84675 24.0415C-0.615584 26.5039 -0.615585 30.4961 1.84675 32.9585L6.50071 37.6124V44.1941C6.50071 47.6763 9.32365 50.4993 12.8059 50.4993H19.3876L24.0415 55.1532C26.5039 57.6156 30.4961 57.6156 32.9585 55.1532L37.6124 50.4993H44.1941C47.6764 50.4993 50.4993 47.6763 50.4993 44.1941V37.6124L55.1532 32.9585C57.6156 30.4961 57.6156 26.5039 55.1532 24.0415L50.4993 19.3876V12.8059C50.4993 9.32362 47.6764 6.50068 44.1941 6.50068H37.6124L32.9585 1.84675Z"
                  fill="url(#paint0_linear)"/>
            <path class="logo-text" fill-rule="evenodd" clip-rule="evenodd"
                  d="M24.7614 37.345L20.7666 40.3417C20.4005 40.616 19.9111 40.6607 19.5015 40.4553C19.0919 40.2511 18.8333 39.833 18.8333 39.375V17.625C18.8333 16.958 19.3746 16.4167 20.0416 16.4167H36.9583C37.6253 16.4167 38.1666 16.958 38.1666 17.625V39.375C38.1666 39.833 37.9081 40.2511 37.4984 40.4553C37.0888 40.6607 36.5994 40.616 36.2333 40.3417L32.2386 37.345L29.3543 40.2293C28.883 40.7018 28.1169 40.7018 27.6457 40.2293L24.7614 37.345ZM35.75 36.9584V18.8334H21.25V36.9584L24.15 34.7834C24.6309 34.4221 25.3039 34.4704 25.7293 34.8957L28.5 37.6664L31.2707 34.8957C31.696 34.4704 32.3691 34.4221 32.85 34.7834L35.75 36.9584ZM27.2916 28.5H29.7083C30.3753 28.5 30.9166 27.9587 30.9166 27.2917C30.9166 26.6247 30.3753 26.0834 29.7083 26.0834H27.2916C26.6246 26.0834 26.0833 26.6247 26.0833 27.2917C26.0833 27.9587 26.6246 28.5 27.2916 28.5ZM24.875 23.6667H32.125C32.792 23.6667 33.3333 23.1254 33.3333 22.4584C33.3333 21.7914 32.792 21.25 32.125 21.25H24.875C24.208 21.25 23.6666 21.7914 23.6666 22.4584C23.6666 23.1254 24.208 23.6667 24.875 23.6667Z"
                  fill="white"/>
            <defs>
            </defs>
        </svg>
        <div class="brand-title">
            <h2 class="">inv<span>ome</span></h2>
            <span class="brand-sub-title">Invoicing Admin</span>
        </div>

    </a>
    <div class="nav-control">
        <div class="hamburger">
            <span class="line"></span><span class="line"></span><span class="line"></span>
        </div>
    </div>
</div>
<!--**********************************
Nav header end
***********************************-->

<!--**********************************
Chat box start
***********************************-->
<div class="chatbox">
    <div class="chatbox-close"></div>
    <div class="custom-tab-1">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#notes">Notes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#alerts">Alerts</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" href="#chat">Chat</a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade active show" id="chat" role="tabpanel">
                <div class="card mb-sm-3 mb-md-0 contacts_card dlab-chat-user-box">
                    <div class="card-header chat-list-header text-center">
                        <a href="javascript:void(0);">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                 width="18px" height="18px" viewBox="0 0 24 24" version="1.1">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <rect fill="#000000" x="4" y="11" width="16" height="2" rx="1"/>
                                    <rect fill="#000000" opacity="0.3"
                                          transform="translate(12.000000, 12.000000) rotate(-270.000000) translate(-12.000000, -12.000000) "
                                          x="4" y="11" width="16" height="2" rx="1"/>
                                </g>
                            </svg>
                        </a>
                        <div>
                            <h6 class="mb-1">Chat List</h6>
                            <p class="mb-0">Show All</p>
                        </div>
                        <a href="javascript:void(0);">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                 width="18px" height="18px" viewBox="0 0 24 24" version="1.1">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <rect x="0" y="0" width="24" height="24"/>
                                    <circle fill="#000000" cx="5" cy="12" r="2"/>
                                    <circle fill="#000000" cx="12" cy="12" r="2"/>
                                    <circle fill="#000000" cx="19" cy="12" r="2"/>
                                </g>
                            </svg>
                        </a>
                    </div>
                    <div class="card-body contacts_body p-0 dlab-scroll  " id="DLAB_W_Contacts_Body">
                        <ul class="contacts">
                            <li class="name-first-letter">A</li>
                            <li class="active dlab-chat-user">
                                <div class="d-flex bd-highlight">
                                    <div class="img_cont">
                                        <img src="./../assets/images/avatar/1.jpg" class="rounded-circle user_img"
                                             alt=""/>
                                        <span class="online_icon"></span>
                                    </div>
                                    <div class="user_info">
                                        <span>Archie Parker</span>
                                        <p>Kalid is online</p>
                                    </div>
                                </div>
                            </li>
                            <li class="dlab-chat-user">
                                <div class="d-flex bd-highlight">
                                    <div class="img_cont">
                                        <img src="./../assets/images/avatar/2.jpg" class="rounded-circle user_img"
                                             alt=""/>
                                        <span class="online_icon offline"></span>
                                    </div>
                                    <div class="user_info">
                                        <span>Alfie Mason</span>
                                        <p>Taherah left 7 mins ago</p>
                                    </div>
                                </div>
                            </li>
                            <li class="dlab-chat-user">
                                <div class="d-flex bd-highlight">
                                    <div class="img_cont">
                                        <img src="./../assets/images/avatar/3.jpg" class="rounded-circle user_img"
                                             alt=""/>
                                        <span class="online_icon"></span>
                                    </div>
                                    <div class="user_info">
                                        <span>AharlieKane</span>
                                        <p>Sami is online</p>
                                    </div>
                                </div>
                            </li>
                            <li class="dlab-chat-user">
                                <div class="d-flex bd-highlight">
                                    <div class="img_cont">
                                        <img src="./../assets/images/avatar/4.jpg" class="rounded-circle user_img"
                                             alt=""/>
                                        <span class="online_icon offline"></span>
                                    </div>
                                    <div class="user_info">
                                        <span>Athan Jacoby</span>
                                        <p>Nargis left 30 mins ago</p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <%--                聊天记录--%>
                <div class="card chat dlab-chat-history-box d-none">
                    <div class="card-header chat-list-header text-center">
                        <a href="javascript:void(0);" class="dlab-chat-history-back">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                 width="18px" height="18px" viewBox="0 0 24 24" version="1.1">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <polygon points="0 0 24 0 24 24 0 24"/>
                                    <rect fill="#000000" opacity="0.3"
                                          transform="translate(15.000000, 12.000000) scale(-1, 1) rotate(-90.000000) translate(-15.000000, -12.000000) "
                                          x="14" y="7" width="2" height="10" rx="1"/>
                                    <path d="M3.7071045,15.7071045 C3.3165802,16.0976288 2.68341522,16.0976288 2.29289093,15.7071045 C1.90236664,15.3165802 1.90236664,14.6834152 2.29289093,14.2928909 L8.29289093,8.29289093 C8.67146987,7.914312 9.28105631,7.90106637 9.67572234,8.26284357 L15.6757223,13.7628436 C16.0828413,14.136036 16.1103443,14.7686034 15.7371519,15.1757223 C15.3639594,15.5828413 14.7313921,15.6103443 14.3242731,15.2371519 L9.03007346,10.3841355 L3.7071045,15.7071045 Z"
                                          fill="#000000" fill-rule="nonzero"
                                          transform="translate(9.000001, 11.999997) scale(-1, -1) rotate(90.000000) translate(-9.000001, -11.999997) "/>
                                </g>
                            </svg>
                        </a>
                        <div>
                            <h6 class="mb-1">Chat with Khelesh</h6>
                            <p class="mb-0 text-success">Online</p>
                        </div>
                        <div class="dropdown">
                            <a href="javascript:void(0);" data-bs-toggle="dropdown" aria-expanded="false">
                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                     width="18px" height="18px" viewBox="0 0 24 24" version="1.1">
                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                        <rect x="0" y="0" width="24" height="24"/>
                                        <circle fill="#000000" cx="5" cy="12" r="2"/>
                                        <circle fill="#000000" cx="12" cy="12" r="2"/>
                                        <circle fill="#000000" cx="19" cy="12" r="2"/>
                                    </g>
                                </svg>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li class="dropdown-item"><i class="fa fa-user-circle text-primary me-2"></i> View
                                    profile
                                </li>
                                <li class="dropdown-item"><i class="fa fa-users text-primary me-2"></i> Add to btn-close
                                    friends
                                </li>
                                <li class="dropdown-item"><i class="fa fa-plus text-primary me-2"></i> Add to group</li>
                                <li class="dropdown-item"><i class="fa fa-ban text-primary me-2"></i> Block</li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-body msg_card_body dlab-scroll" id="DLAB_W_Contacts_Body3">
                        <div class="d-flex justify-content-start mb-4">
                            <div class="img_cont_msg">
                                <img src="./../assets/images/avatar/1.jpg" class="rounded-circle user_img_msg" alt=""/>
                            </div>
                            <div class="msg_cotainer">
                                Hi, how are you samim?
                                <span class="msg_time">8:40 AM, Today</span>
                            </div>
                        </div>
                        <div class="d-flex justify-content-end mb-4">
                            <div class="msg_cotainer_send">
                                Hi Khalid i am good tnx how about you?
                                <span class="msg_time_send">8:55 AM, Today</span>
                            </div>
                            <div class="img_cont_msg">
                                <img src="./../assets/images/avatar/2.jpg" class="rounded-circle user_img_msg" alt=""/>
                            </div>
                        </div>
                        <div class="d-flex justify-content-start mb-4">
                            <div class="img_cont_msg">
                                <img src="./../assets/images/avatar/1.jpg" class="rounded-circle user_img_msg" alt=""/>
                            </div>
                            <div class="msg_cotainer">
                                I am good too, thank you for your chat template
                                <span class="msg_time">9:00 AM, Today</span>
                            </div>
                        </div>
                        <div class="d-flex justify-content-end mb-4">
                            <div class="msg_cotainer_send">
                                You are welcome
                                <span class="msg_time_send">9:05 AM, Today</span>
                            </div>
                            <div class="img_cont_msg">
                                <img src="./../assets/images/avatar/2.jpg" class="rounded-circle user_img_msg" alt=""/>
                            </div>
                        </div>
                        <div class="d-flex justify-content-start mb-4">
                            <div class="img_cont_msg">
                                <img src="./../assets/images/avatar/1.jpg" class="rounded-circle user_img_msg" alt=""/>
                            </div>
                            <div class="msg_cotainer">
                                I am looking for your next templates
                                <span class="msg_time">9:07 AM, Today</span>
                            </div>
                        </div>
                        <div class="d-flex justify-content-end mb-4">
                            <div class="msg_cotainer_send">
                                Ok, thank you have a good day
                                <span class="msg_time_send">9:10 AM, Today</span>
                            </div>
                            <div class="img_cont_msg">
                                <img src="./../assets/images/avatar/2.jpg" class="rounded-circle user_img_msg" alt=""/>
                            </div>
                        </div>
                        <div class="d-flex justify-content-start mb-4">
                            <div class="img_cont_msg">
                                <img src="./../assets/images/avatar/1.jpg" class="rounded-circle user_img_msg" alt=""/>
                            </div>
                            <div class="msg_cotainer">
                                Bye, see you
                                <span class="msg_time">9:12 AM, Today</span>
                            </div>
                        </div>
                        <div class="d-flex justify-content-start mb-4">
                            <div class="img_cont_msg">
                                <img src="./../assets/images/avatar/1.jpg" class="rounded-circle user_img_msg" alt=""/>
                            </div>
                            <div class="msg_cotainer">
                                Hi, how are you samim?
                                <span class="msg_time">8:40 AM, Today</span>
                            </div>
                        </div>
                        <div class="d-flex justify-content-end mb-4">
                            <div class="msg_cotainer_send">
                                Hi Khalid i am good tnx how about you?
                                <span class="msg_time_send">8:55 AM, Today</span>
                            </div>
                            <div class="img_cont_msg">
                                <img src="./../assets/images/avatar/2.jpg" class="rounded-circle user_img_msg" alt=""/>
                            </div>
                        </div>
                        <div class="d-flex justify-content-start mb-4">
                            <div class="img_cont_msg">
                                <img src="./../assets/images/avatar/1.jpg" class="rounded-circle user_img_msg" alt=""/>
                            </div>
                            <div class="msg_cotainer">
                                I am good too, thank you for your chat template
                                <span class="msg_time">9:00 AM, Today</span>
                            </div>
                        </div>
                        <div class="d-flex justify-content-end mb-4">
                            <div class="msg_cotainer_send">
                                You are welcome
                                <span class="msg_time_send">9:05 AM, Today</span>
                            </div>
                            <div class="img_cont_msg">
                                <img src="./../assets/images/avatar/2.jpg" class="rounded-circle user_img_msg" alt=""/>
                            </div>
                        </div>
                        <div class="d-flex justify-content-start mb-4">
                            <div class="img_cont_msg">
                                <img src="./../assets/images/avatar/1.jpg" class="rounded-circle user_img_msg" alt=""/>
                            </div>
                            <div class="msg_cotainer">
                                I am looking for your next templates
                                <span class="msg_time">9:07 AM, Today</span>
                            </div>
                        </div>
                        <div class="d-flex justify-content-end mb-4">
                            <div class="msg_cotainer_send">
                                Ok, thank you have a good day
                                <span class="msg_time_send">9:10 AM, Today</span>
                            </div>
                            <div class="img_cont_msg">
                                <img src="./../assets/images/avatar/2.jpg" class="rounded-circle user_img_msg" alt=""/>
                            </div>
                        </div>
                        <div class="d-flex justify-content-start mb-4">
                            <div class="img_cont_msg">
                                <img src="./../assets/images/avatar/1.jpg" class="rounded-circle user_img_msg" alt=""/>
                            </div>
                            <div class="msg_cotainer">
                                Bye, see you
                                <span class="msg_time">9:12 AM, Today</span>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer type_msg">
                        <div class="input-group">
                            <textarea class="form-control" placeholder="Type your message..."></textarea>
                            <div class="input-group-append">
                                <button type="button" class="btn btn-primary"><i class="fa fa-location-arrow"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="alerts" role="tabpanel">
                <div class="card mb-sm-3 mb-md-0 contacts_card">
                    <div class="card-header chat-list-header text-center">
                        <a href="javascript:void(0);">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                 width="18px" height="18px" viewBox="0 0 24 24" version="1.1">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <rect x="0" y="0" width="24" height="24"/>
                                    <circle fill="#000000" cx="5" cy="12" r="2"/>
                                    <circle fill="#000000" cx="12" cy="12" r="2"/>
                                    <circle fill="#000000" cx="19" cy="12" r="2"/>
                                </g>
                            </svg>
                        </a>
                        <div>
                            <h6 class="mb-1">Notications</h6>
                            <p class="mb-0">Show All</p>
                        </div>
                        <a href="javascript:void(0);">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                 width="18px" height="18px" viewBox="0 0 24 24" version="1.1">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <rect x="0" y="0" width="24" height="24"/>
                                    <path d="M14.2928932,16.7071068 C13.9023689,16.3165825 13.9023689,15.6834175 14.2928932,15.2928932 C14.6834175,14.9023689 15.3165825,14.9023689 15.7071068,15.2928932 L19.7071068,19.2928932 C20.0976311,19.6834175 20.0976311,20.3165825 19.7071068,20.7071068 C19.3165825,21.0976311 18.6834175,21.0976311 18.2928932,20.7071068 L14.2928932,16.7071068 Z"
                                          fill="#000000" fill-rule="nonzero" opacity="0.3"/>
                                    <path d="M11,16 C13.7614237,16 16,13.7614237 16,11 C16,8.23857625 13.7614237,6 11,6 C8.23857625,6 6,8.23857625 6,11 C6,13.7614237 8.23857625,16 11,16 Z M11,18 C7.13400675,18 4,14.8659932 4,11 C4,7.13400675 7.13400675,4 11,4 C14.8659932,4 18,7.13400675 18,11 C18,14.8659932 14.8659932,18 11,18 Z"
                                          fill="#000000" fill-rule="nonzero"/>
                                </g>
                            </svg>
                        </a>
                    </div>
                    <div class="card-body contacts_body p-0 dlab-scroll" id="DLAB_W_Contacts_Body1">
                        <ul class="contacts">
                            <li class="name-first-letter">SEVER STATUS</li>
                            <li class="active">
                                <div class="d-flex bd-highlight">
                                    <div class="img_cont primary">KK</div>
                                    <div class="user_info">
                                        <span>David Nester Birthday</span>
                                        <p class="text-primary">Today</p>
                                    </div>
                                </div>
                            </li>
                            <li class="name-first-letter">SOCIAL</li>
                            <li>
                                <div class="d-flex bd-highlight">
                                    <div class="img_cont success">RU</div>
                                    <div class="user_info">
                                        <span>Perfection Simplified</span>
                                        <p>Jame Smith commented on your status</p>
                                    </div>
                                </div>
                            </li>
                            <li class="name-first-letter">SEVER STATUS</li>
                            <li>
                                <div class="d-flex bd-highlight">
                                    <div class="img_cont primary">AU</div>
                                    <div class="user_info">
                                        <span>AharlieKane</span>
                                        <p>Sami is online</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="d-flex bd-highlight">
                                    <div class="img_cont info">MO</div>
                                    <div class="user_info">
                                        <span>Athan Jacoby</span>
                                        <p>Nargis left 30 mins ago</p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="card-footer"></div>
                </div>
            </div>
            <div class="tab-pane fade" id="notes">
                <div class="card mb-sm-3 mb-md-0 note_card">
                    <div class="card-header chat-list-header text-center">
                        <a href="javascript:void(0);">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                 width="18px" height="18px" viewBox="0 0 24 24" version="1.1">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <rect fill="#000000" x="4" y="11" width="16" height="2" rx="1"/>
                                    <rect fill="#000000" opacity="0.3"
                                          transform="translate(12.000000, 12.000000) rotate(-270.000000) translate(-12.000000, -12.000000) "
                                          x="4" y="11" width="16" height="2" rx="1"/>
                                </g>
                            </svg>
                        </a>
                        <div>
                            <h6 class="mb-1">Notes</h6>
                            <p class="mb-0">Add New Nots</p>
                        </div>
                        <a href="javascript:void(0);">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                 width="18px" height="18px" viewBox="0 0 24 24" version="1.1">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <rect x="0" y="0" width="24" height="24"/>
                                    <path d="M14.2928932,16.7071068 C13.9023689,16.3165825 13.9023689,15.6834175 14.2928932,15.2928932 C14.6834175,14.9023689 15.3165825,14.9023689 15.7071068,15.2928932 L19.7071068,19.2928932 C20.0976311,19.6834175 20.0976311,20.3165825 19.7071068,20.7071068 C19.3165825,21.0976311 18.6834175,21.0976311 18.2928932,20.7071068 L14.2928932,16.7071068 Z"
                                          fill="#000000" fill-rule="nonzero" opacity="0.3"/>
                                    <path d="M11,16 C13.7614237,16 16,13.7614237 16,11 C16,8.23857625 13.7614237,6 11,6 C8.23857625,6 6,8.23857625 6,11 C6,13.7614237 8.23857625,16 11,16 Z M11,18 C7.13400675,18 4,14.8659932 4,11 C4,7.13400675 7.13400675,4 11,4 C14.8659932,4 18,7.13400675 18,11 C18,14.8659932 14.8659932,18 11,18 Z"
                                          fill="#000000" fill-rule="nonzero"/>
                                </g>
                            </svg>
                        </a>
                    </div>
                    <div class="card-body contacts_body p-0 dlab-scroll" id="DLAB_W_Contacts_Body2">
                        <ul class="contacts">
                            <li class="active">
                                <div class="d-flex bd-highlight">
                                    <div class="user_info">
                                        <span>New order placed..</span>
                                        <p>10 Aug 2020</p>
                                    </div>
                                    <div class="ms-auto">
                                        <a href="javascript:void(0);" class="btn btn-primary btn-xs sharp me-1"><i
                                                class="fas fa-pencil-alt"></i></a>
                                        <a href="javascript:void(0);" class="btn btn-danger btn-xs sharp"><i
                                                class="fa fa-trash"></i></a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="d-flex bd-highlight">
                                    <div class="user_info">
                                        <span>Youtube, a video-sharing website..</span>
                                        <p>10 Aug 2020</p>
                                    </div>
                                    <div class="ms-auto">
                                        <a href="javascript:void(0);" class="btn btn-primary btn-xs sharp me-1"><i
                                                class="fas fa-pencil-alt"></i></a>
                                        <a href="javascript:void(0);" class="btn btn-danger btn-xs sharp"><i
                                                class="fa fa-trash"></i></a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="d-flex bd-highlight">
                                    <div class="user_info">
                                        <span>john just buy your product..</span>
                                        <p>10 Aug 2020</p>
                                    </div>
                                    <div class="ms-auto">
                                        <a href="javascript:void(0);" class="btn btn-primary btn-xs sharp me-1"><i
                                                class="fas fa-pencil-alt"></i></a>
                                        <a href="javascript:void(0);" class="btn btn-danger btn-xs sharp"><i
                                                class="fa fa-trash"></i></a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="d-flex bd-highlight">
                                    <div class="user_info">
                                        <span>Athan Jacoby</span>
                                        <p>10 Aug 2020</p>
                                    </div>
                                    <div class="ms-auto">
                                        <a href="javascript:void(0);" class="btn btn-primary btn-xs sharp me-1"><i
                                                class="fas fa-pencil-alt"></i></a>
                                        <a href="javascript:void(0);" class="btn btn-danger btn-xs sharp"><i
                                                class="fa fa-trash"></i></a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--**********************************
Chat box End
***********************************-->


<!--**********************************
Header start
***********************************-->
<div class="header">
    <div class="header-content">
        <nav class="navbar navbar-expand">
            <div class="collapse navbar-collapse justify-content-between">
                <div class="header-left">
                    <div class="dashboard_bar" id="user_id">
                    </div>

                </div>
                <ul class="navbar-nav header-right">
                    <li class="nav-item d-flex align-items-center">
                        <div class="input-group search-area">
                            <input type="text" class="form-control" placeholder="Search here...">
                            <span class="input-group-text"><a href="javascript:void(0)"><i
                                    class="flaticon-381-search-2"></i></a></span>
                        </div>
                    </li>

                    <li class="nav-item dropdown notification_dropdown">
                        <a class="nav-link" href="javascript:void(0);" role="button" data-bs-toggle="dropdown">
                            <svg width="32" height="32" viewBox="0 0 32 32" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <g clip-path="">
                                    <path d="M28.0948 25.0879H26.6026V11.3407C26.6026 10.7074 26.5333 10.0741 26.3965 9.45825C26.2318 8.717 25.4985 8.24975 24.7572 8.41431C24.0164 8.57912 23.5494 9.31363 23.7141 10.0549C23.8058 10.4676 23.8547 10.9115 23.8547 11.3407V25.0879L8.08365 25.088V11.4309C8.08365 8.38875 10.6582 5.62356 13.8228 5.26694C13.8273 5.26644 13.8317 5.26562 13.8362 5.26506C14.5092 5.18325 15.0368 4.59319 15.0427 3.914C15.0427 3.9095 15.043 3.90506 15.043 3.90056C15.043 3.26619 15.5576 2.75 16.1902 2.75C16.8228 2.75 17.3375 3.26612 17.3375 3.90069C17.3375 4.55975 17.8577 5.16475 18.5103 5.26069C19.2389 5.36862 19.94 5.60462 20.594 5.96219C20.8032 6.07656 21.0289 6.13081 21.2515 6.13081C21.7377 6.13081 22.2089 5.87188 22.4585 5.41475C22.8223 4.74831 22.5773 3.91294 21.9115 3.54888C21.2738 3.20025 20.6042 2.93225 19.9114 2.74719C19.4192 1.15775 17.9372 0 16.1902 0C14.4558 0 12.9832 1.14125 12.4803 2.71294C10.7098 3.1255 9.07122 4.06819 7.78547 5.42975C6.20572 7.10281 5.33572 9.23406 5.33572 11.4309V25.0881H3.90528C3.14647 25.0881 2.53134 25.7037 2.53134 26.4631C2.53134 27.2224 3.14647 27.8381 3.90528 27.8381H11.5226C11.6948 30.1617 13.6364 32 16 32C18.3637 32 20.3053 30.1616 20.4775 27.838H28.0948C28.8537 27.838 29.4688 27.2224 29.4688 26.463C29.4688 25.7036 28.8537 25.0879 28.0948 25.0879ZM16 29.25C15.1533 29.25 14.4458 28.6416 14.2892 27.838H17.7108C17.5542 28.6416 16.8468 29.25 16 29.25Z"
                                          fill="#717579"/>
                                    <path d="M23.8691 8.18592C24.6279 8.18592 25.2431 7.57031 25.2431 6.81092C25.2431 6.05152 24.6279 5.43591 23.8691 5.43591C23.1103 5.43591 22.4952 6.05152 22.4952 6.81092C22.4952 7.57031 23.1103 8.18592 23.8691 8.18592Z"
                                          fill="#717579"/>
                                </g>
                                <defs>
                                    <clipPath>
                                        <rect width="32" height="32" fill="white"/>
                                    </clipPath>
                                </defs>
                            </svg>
                            <span class="badge light text-white bg-warning rounded-circle">12</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end">
                            <div id="DZ_W_Notification1" class="widget-media dlab-scroll p-3" style="height:380px;">
                                <ul class="timeline">
                                    <li>
                                        <div class="timeline-panel">
                                            <div class="media me-2">
                                                <img alt="image" width="50" src="./../assets/images/avatar/1.jpg">
                                            </div>
                                            <div class="media-body">
                                                <h6 class="mb-1">Dr sultads Send you Photo</h6>
                                                <small class="d-block">29 July 2020 - 02:26 PM</small>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="timeline-panel">
                                            <div class="media me-2 media-info">
                                                KG
                                            </div>
                                            <div class="media-body">
                                                <h6 class="mb-1">Resport created successfully</h6>
                                                <small class="d-block">29 July 2020 - 02:26 PM</small>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="timeline-panel">
                                            <div class="media me-2 media-success">
                                                <i class="fa fa-home"></i>
                                            </div>
                                            <div class="media-body">
                                                <h6 class="mb-1">Reminder : Treatment Time!</h6>
                                                <small class="d-block">29 July 2020 - 02:26 PM</small>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="timeline-panel">
                                            <div class="media me-2">
                                                <img alt="image" width="50" src="./../assets/images/avatar/1.jpg">
                                            </div>
                                            <div class="media-body">
                                                <h6 class="mb-1">Dr sultads Send you Photo</h6>
                                                <small class="d-block">29 July 2020 - 02:26 PM</small>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="timeline-panel">
                                            <div class="media me-2 media-danger">
                                                KG
                                            </div>
                                            <div class="media-body">
                                                <h6 class="mb-1">Resport created successfully</h6>
                                                <small class="d-block">29 July 2020 - 02:26 PM</small>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="timeline-panel">
                                            <div class="media me-2 media-primary">
                                                <i class="fa fa-home"></i>
                                            </div>
                                            <div class="media-body">
                                                <h6 class="mb-1">Reminder : Treatment Time!</h6>
                                                <small class="d-block">29 July 2020 - 02:26 PM</small>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <a class="all-notification" href="javascript:void(0);">See all notifications <i
                                    class="ti-arrow-end"></i></a>
                        </div>
                    </li>
                    <li class="nav-item dropdown notification_dropdown">
                        <a class="nav-link bell-link " href="javascript:void(0);">
                            <svg width="32" height="32" viewBox="0 0 32 32" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <g clip-path="">
                                    <path d="M20.4632 3.4715H11.5369C5.17544 3.4715 0 8.63718 0 14.9867V20.4849C0 26.8344 5.17544 32.0001 11.5369 32.0001H20.5686C21.328 32.0001 21.9436 31.3844 21.9436 30.6251C21.9436 29.8657 21.328 29.2501 20.5686 29.2501H11.5369C6.69181 29.2501 2.75 25.318 2.75 20.4849V14.9867C2.75 13.2669 3.2495 11.6614 4.11081 10.3064L12.4198 17.0756L12.4315 17.085C13.4248 17.8762 14.7284 18.3115 16.1044 18.3115H16.1214C17.4992 18.3079 18.8024 17.8682 19.7926 17.0732L28.0844 10.6274C28.8258 11.9121 29.2501 13.4007 29.2501 14.9865V20.958C29.2501 22.1491 29.0027 23.2979 28.515 24.3729C28.0432 25.4126 27.3724 26.3305 26.5209 27.1011C25.9579 27.6106 25.9146 28.4801 26.4241 29.0432C26.9337 29.6063 27.8032 29.6496 28.3662 29.14C29.4984 28.1153 30.391 26.8937 31.0193 25.5091C31.6701 24.0749 32 22.5437 32 20.9581V14.9866C32 8.63712 26.8246 3.4715 20.4632 3.4715ZM18.0956 14.9092L18.0758 14.9249C17.0344 15.7656 15.2018 15.7711 14.1501 14.9381L5.93113 8.24218C7.4535 6.98087 9.40794 6.2215 11.5369 6.2215H20.4632C22.7278 6.2215 24.7949 7.08062 26.3545 8.48912L18.0956 14.9092Z"
                                          fill="#717579"/>
                                    <path d="M24.5181 31.8096C25.2775 31.8096 25.8931 31.194 25.8931 30.4346C25.8931 29.6752 25.2775 29.0596 24.5181 29.0596C23.7587 29.0596 23.1431 29.6752 23.1431 30.4346C23.1431 31.194 23.7587 31.8096 24.5181 31.8096Z"
                                          fill="#717579"/>
                                </g>
                                <defs>
                                    <clipPath>
                                        <rect width="32" height="32" fill="white"/>
                                    </clipPath>
                                </defs>
                            </svg>
                            <span class="badge light text-white bg-warning rounded-circle">76</span>
                        </a>
                    </li>


                    <li class="nav-item dropdown notification_dropdown">
                        <a class="nav-link " href="javascript:void(0);" data-bs-toggle="dropdown">
                            <svg width="32" height="32" viewBox="0 0 32 32" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="M32 12.7087C32 12.6285 31.9928 12.5501 31.9796 12.4736C31.6646 7.57756 27.6102 3.67738 22.6341 3.57681V1.375C22.6341 0.615625 22.0184 0 21.2591 0C20.4997 0 19.8841 0.615625 19.8841 1.375V3.57431H11.6726V1.375C11.6726 0.615625 11.0569 0 10.2976 0C9.53819 0 8.92256 0.615625 8.92256 1.375V3.59612C3.94706 3.92506 0 8.05588 0 13.0872V21.4244C0 27.2558 4.76956 32 10.6322 32H20.9373C21.6967 32 22.3123 31.3844 22.3123 30.625C22.3123 29.8656 21.6967 29.25 20.9373 29.25H10.6322C6.28594 29.25 2.75 25.7394 2.75 21.4244V14.0837H29.25V20.9966C29.25 22.1813 29.003 23.3243 28.5158 24.3937C28.0444 25.4284 27.3739 26.342 26.5229 27.1092C25.9589 27.6177 25.9138 28.4871 26.4223 29.0511C26.9309 29.6151 27.8002 29.6601 28.3642 29.1518C29.4969 28.1306 30.3898 26.9134 31.0184 25.5336C31.6698 24.1039 32 22.5774 32 20.9966V13.0872C32 12.9952 31.9984 12.9036 31.9958 12.8122C31.9983 12.778 32 12.7436 32 12.7087ZM8.92988 6.35375C9.001 7.04638 9.58619 7.58663 10.2976 7.58663C11.019 7.58663 11.6102 7.03094 11.6676 6.32431H19.889C19.9464 7.03094 20.5376 7.58663 21.259 7.58663C21.9794 7.58663 22.5701 7.03244 22.6288 6.32713C25.6904 6.41156 28.2531 8.51081 29.0173 11.3337H2.98269C3.70981 8.64756 6.0655 6.61706 8.92988 6.35375Z"
                                      fill="#717579"/>
                                <path d="M24.7114 31.81C25.4708 31.81 26.0864 31.1944 26.0864 30.435C26.0864 29.6756 25.4708 29.06 24.7114 29.06C23.952 29.06 23.3364 29.6756 23.3364 30.435C23.3364 31.1944 23.952 31.81 24.7114 31.81Z"
                                      fill="#717579"/>
                            </svg>

                            <span class="badge light text-white bg-primary rounded-circle">!</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end">
                            <div id="DZ_W_TimeLine02"
                                 class="widget-timeline dlab-scroll style-1 ps ps--active-y p-3 height370">
                                <ul class="timeline">
                                    <li>
                                        <div class="timeline-badge primary"></div>
                                        <a class="timeline-panel text-muted" href="javascript:void(0);">
                                            <span>10 minutes ago</span>
                                            <h6 class="mb-0">Youtube, a video-sharing website, goes live <strong
                                                    class="text-primary">$500</strong>.</h6>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="timeline-badge info">
                                        </div>
                                        <a class="timeline-panel text-muted" href="javascript:void(0);">
                                            <span>20 minutes ago</span>
                                            <h6 class="mb-0">New order placed <strong
                                                    class="text-info">#XF-2356.</strong></h6>
                                            <p class="mb-0">Quisque a consequat ante Sit amet magna at volutapt...</p>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="timeline-badge danger">
                                        </div>
                                        <a class="timeline-panel text-muted" href="javascript:void(0);">
                                            <span>30 minutes ago</span>
                                            <h6 class="mb-0">john just buy your product <strong class="text-warning">Sell
                                                $250</strong></h6>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="timeline-badge success">
                                        </div>
                                        <a class="timeline-panel text-muted" href="javascript:void(0);">
                                            <span>15 minutes ago</span>
                                            <h6 class="mb-0">StumbleUpon is acquired by eBay. </h6>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="timeline-badge warning">
                                        </div>
                                        <a class="timeline-panel text-muted" href="javascript:void(0);">
                                            <span>20 minutes ago</span>
                                            <h6 class="mb-0">Mashable, a news website and blog, goes live.</h6>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="timeline-badge dark">
                                        </div>
                                        <a class="timeline-panel text-muted" href="javascript:void(0);">
                                            <span>20 minutes ago</span>
                                            <h6 class="mb-0">Mashable, a news website and blog, goes live.</h6>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item invoices-btn">
                        <a href="javascript:void(0);" class="btn btn-primary ms-5"><i
                                class="far fa-file-alt fs-20 me-2"></i>New Invoices</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>


<!--**********************************
Sidebar start
***********************************-->
<div class="dlabnav">
    <div class="dlabnav-scroll">
        <div class="dropdown header-profile2 ">
            <a class="nav-link " href="javascript:void(0);" role="button" data-bs-toggle="dropdown">
                <div class="header-info2 d-flex align-items-center border">
                    <img src="<%=user.avatarURL%>" alt=""/>
                    <div class="d-flex align-items-center sidebar-info">
                        <div>
                            <span class="font-w700 d-block mb-2"><%=user.id%></span>
                            <small class="text-end font-w400"><%=userType%></small>
                        </div>
                        <i class="fas fa-sort-down ms-4"></i>
                    </div>

                </div>
            </a>
            <div class="dropdown-menu dropdown-menu-end">
                <a href="" class="dropdown-item ai-icon" id="to-profile">
                    <svg xmlns="http://www.w3.org/2000/svg" class="text-primary" width="18" height="18"
                         viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                         stroke-linejoin="round">
                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                        <circle cx="12" cy="7" r="4"></circle>
                    </svg>
                    <span class="ms-2">Profile </span>
                </a>
                <a href="./email-inbox.html" class="dropdown-item ai-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" class="text-success" width="18" height="18"
                         viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                         stroke-linejoin="round">
                        <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                        <polyline points="22,6 12,13 2,6"></polyline>
                    </svg>
                    <span class="ms-2">Inbox </span>
                </a>
                <a href="/logout" class="dropdown-item ai-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" class="text-danger" width="18" height="18"
                         viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                         stroke-linejoin="round">
                        <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                        <polyline points="16 17 21 12 16 7"></polyline>
                        <line x1="21" y1="12" x2="9" y2="12"></line>
                    </svg>
                    <span class="ms-2">Logout </span>
                </a>
            </div>
        </div>
        <ul class="metismenu" id="menu">

            <%--            商场--%>
            <li>
                <a class="has-arrow " href="javascript:void()" aria-expanded="false">
                    <i class="fas fa-tachometer-alt"></i>
                    <span class="nav-text">商场</span>
                </a>
                <ul aria-expanded="false">
                    <li><a href="/market/house_market.jsp">民宿商场</a></li>
                    <li><a href="/market/specialty_market.jsp">特产商场</a></li>
                    <%--                    <li><a href="wallet-page.html">My Wallet</a></li>--%>
                    <%--                    <li><a href="invoices.html">Invoices</a></li>--%>
                    <%--                    <li><a href="create-invoices.html">Create Invoices</a></li>--%>
                    <%--                    <li><a href="card-center.html">Card-Center</a></li>--%>
                    <%--                    <li><a href="transaction-details.html">Transaction</a></li>--%>
                </ul>
            </li>

            <%--            商品管理--%>
            <%if (user.permission.equals("middle")) {%>
            <li>
                <a class="has-arrow " href="javascript:;" aria-expanded="false">
                    <i class="fas fa-info-circle"></i>
                    <span class="nav-text">我的商品管理</span>
                </a>
                <ul aria-expanded="false">
                    <li><a href="/seller/">民宿/房源</a></li>
                    <li><a href="/seller/goods_list.jsp">特产</a></li>
                </ul>
            </li>
            <%}%>
            <%--            订单管理--%>
            <li>
                <a href="/order/device/specialty_order.jsp">
                    <i class="fas fa-chart-line"></i>
                    <span class="nav-text">我的订单</span>
                </a>
            </li>
            <li>
                <a href="/GPS/GPS.jsp">
                    <i class="fas fa-chart-line"></i>
                    <span class="nav-text">地图导航</span>
                </a>
            </li>
            <li>
                <a href="/weather/weather.jsp">
                    <i class="fas fa-chart-line"></i>
                    <span class="nav-text">今日天气</span>
                </a>
            </li>
            <%if (user.permission.equals("superhigh")) {%>
            <li>
                <a href="/superadmin/users.jsp">
                    <i class="fas fa-chart-line"></i>
                    <span class="nav-text">用户管理</span>
                </a>
            </li>
            <%}%>
            <%--            <li>--%>
            <%--                <a class="has-arrow " href="javascript:void()" aria-expanded="false">--%>
            <%--                    <i class="fab fa-bootstrap"></i>--%>
            <%--                    <span class="nav-text">Bootstrap</span>--%>
            <%--                </a>--%>
            <%--                <ul aria-expanded="false">--%>
            <%--                    <li><a href="./ui-accordion.html">Accordion</a></li>--%>
            <%--                    <li><a href="./ui-alert.html">Alert</a></li>--%>
            <%--                    <li><a href="./ui-badge.html">Badge</a></li>--%>
            <%--                    <li><a href="./ui-button.html">Button</a></li>--%>
            <%--                    <li><a href="./ui-modal.html">Modal</a></li>--%>
            <%--                    <li><a href="./ui-button-group.html">Button Group</a></li>--%>
            <%--                    <li><a href="./ui-list-group.html">List Group</a></li>--%>
            <%--                    <li><a href="./ui-card.html">Cards</a></li>--%>
            <%--                    <li><a href="./ui-carousel.html">Carousel</a></li>--%>
            <%--                    <li><a href="./ui-dropdown.html">Dropdown</a></li>--%>
            <%--                    <li><a href="./ui-popover.html">Popover</a></li>--%>
            <%--                    <li><a href="./ui-progressbar.html">Progressbar</a></li>--%>
            <%--                    <li><a href="./ui-tab.html">Tab</a></li>--%>
            <%--                    <li><a href="./ui-typography.html">Typography</a></li>--%>
            <%--                    <li><a href="./ui-pagination.html">Pagination</a></li>--%>
            <%--                    <li><a href="./ui-grid.html">Grid</a></li>--%>

            <%--                </ul>--%>
            <%--            </li>--%>
            <%--            <li><a class="has-arrow " href="javascript:void()" aria-expanded="false">--%>
            <%--                <i class="fas fa-heart"></i>--%>
            <%--                <span class="nav-text">Plugins</span>--%>
            <%--            </a>--%>
            <%--                <ul aria-expanded="false">--%>
            <%--                    <li><a href="./uc-select2.html">Select 2</a></li>--%>
            <%--                    <li><a href="./uc-nestable.html">Nestedable</a></li>--%>
            <%--                    <li><a href="./uc-noui-slider.html">Noui Slider</a></li>--%>
            <%--                    <li><a href="./uc-sweetalert.html">Sweet Alert</a></li>--%>
            <%--                    <li><a href="./uc-toastr.html">Toastr</a></li>--%>
            <%--                    <li><a href="./map-jqvmap.html">Jqv Map</a></li>--%>
            <%--                    <li><a href="./uc-lightgallery.html">Light Gallery</a></li>--%>
            <%--                </ul>--%>
            <%--            </li>--%>
            <%--            <li><a href="widget-basic.html" class="" aria-expanded="false">--%>
            <%--                <i class="fas fa-user-check"></i>--%>
            <%--                <span class="nav-text">Widget</span>--%>
            <%--            </a>--%>
            <%--            </li>--%>
            <%--            <li><a class="has-arrow " href="javascript:void()" aria-expanded="false">--%>
            <%--                <i class="fas fa-file-alt"></i>--%>
            <%--                <span class="nav-text">Forms</span>--%>
            <%--            </a>--%>
            <%--                <ul aria-expanded="false">--%>
            <%--                    <li><a href="./form-element.html">Form Elements</a></li>--%>
            <%--                    <li><a href="./form-wizard.html">Wizard</a></li>--%>
            <%--                    <li><a href="./form-ckeditor.html">CkEditor</a></li>--%>
            <%--                    <li><a href="form-pickers.html">Pickers</a></li>--%>
            <%--                    <li><a href="form-validation.html">Form Validate</a></li>--%>
            <%--                </ul>--%>
            <%--            </li>--%>
            <%--            <li><a class="has-arrow " href="javascript:void()" aria-expanded="false">--%>
            <%--                <i class="fas fa-table"></i>--%>
            <%--                <span class="nav-text">Table</span>--%>
            <%--            </a>--%>
            <%--                <ul aria-expanded="false">--%>
            <%--                    <li><a href="table-bootstrap-basic.html">Bootstrap</a></li>--%>
            <%--                    <li><a href="table-datatable-basic.html">Datatable</a></li>--%>
            <%--                </ul>--%>
            <%--            </li>--%>
            <%--            <li><a href="/feedback/feedback-page.jsp">--%>
            <%--                <i class="fas fa-clone"></i>--%>
            <%--                <span class="nav-text">问题反馈</span>--%>
            <%--            </a>--%>
            <%--            </li>--%>
        </ul>

        <div class="copyright">
            <p><strong>SCU Stay</strong> © 2021 All Rights Reserved</p>
            <p class="fs-12">Made with <i class="fa fa-heart me-2"></i>Yankai 01 group</p>
        </div>
    </div>
</div>
