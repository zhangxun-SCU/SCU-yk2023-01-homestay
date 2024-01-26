<%@ page import="homestay.utils.UserUtil" %>
<%@ page import="homestay.dao.UserDao" %>
<%@ page import="homestay.entity.User" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.json.JSONException" %>
<%@ page import="homestay.utils.Config" %>
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
    <a href="../index.jsp" class="brand-logo">
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

                    <%if (user.permission.equals("low")) {%>
                    <li class="nav-item ">
                        <a href="<%=Config.getInstance().getString("default.urlheader")%>/user/landlord.jsp" class="btn btn-primary ms-3" id="beLandlord">房东认证</a>
                    </li>
                    <%}%>
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
                    <span class="ms-2">个人简介 </span>
                </a>
                <a href="<%=Config.getInstance().getString("default.urlheader")%>/logout" class="dropdown-item ai-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" class="text-danger" width="18" height="18"
                         viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                         stroke-linejoin="round">
                        <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                        <polyline points="16 17 21 12 16 7"></polyline>
                        <line x1="21" y1="12" x2="9" y2="12"></line>
                    </svg>
                    <span class="ms-2">注销 </span>
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
                    <li><a href="<%=Config.getInstance().getString("default.urlheader")%>/market/house_market.jsp">民宿商场</a></li>
                    <li><a href="<%=Config.getInstance().getString("default.urlheader")%>/market/specialty_market.jsp">特产商场</a></li>
                </ul>
            </li>

            <%--            商品管理--%>
            <%if (user.permission.equals("middle")) {%>
            <li>
                <a href="<%=Config.getInstance().getString("default.urlheader")%>/seller/goods_list.jsp">
                    <i class="fas fa-info-circle"></i>
                    <span class="nav-text">销售商品管理</span>
                </a>
<%--                    <li><a href="/seller/goods_list.jsp">民宿/房源</a></li>--%>
            </li>
            <%}%>
                <%if (user.permission.equals("middle")) {%>

                <li>
                    <a class="has-arrow" href="javascript:void();" aria-expanded="false">
                        <i class="fas fa-info-circle"></i>
                        <span class="nav-text">销售订单管理</span>
                    </a>
                    <ul aria-expanded="false">
                        <li><a href="<%=Config.getInstance().getString("default.urlheader")%>/order/room/room_order_seller.jsp">民宿订单</a></li>
                        <li><a href="<%=Config.getInstance().getString("default.urlheader")%>/order/device/specialty_order_seller.jsp">特产订单</a></li>
                    </ul>
                </li>
                <%}%>

                <li>
                    <a href="<%=Config.getInstance().getString("default.urlheader")%>/market/cart.jsp">
                        <i class="fas fa-heart"></i>
                        <span class="nav-text">购物车</span>
                    </a>
                </li>
            <%--            订单--%>

            <li>
                <a class="has-arrow" href="javascript:void();" aria-expanded="false">
                    <i class="fas fa-file-alt"></i>
                    <span class="nav-text">我的订单</span>
                </a>
                <ul aria-expanded="false">
                    <li>
                        <a href="<%=Config.getInstance().getString("default.urlheader")%>/order/room/room_order.jsp">房间</a>
                    </li>
                    <li><a href="<%=Config.getInstance().getString("default.urlheader")%>/order/device/specialty_order.jsp">特产</a></li>
                </ul>
            </li>

            <li>
                <a href="<%=Config.getInstance().getString("default.urlheader")%>/GPS/GPS.jsp">
                    <i class="fas fa-map"></i>
                    <span class="nav-text">地图导航</span>
                </a>
            </li>
            <li>
                <a href="<%=Config.getInstance().getString("default.urlheader")%>/weather/weather.jsp">
                    <i class="fas fa-cloud"></i>
                    <span class="nav-text">今日天气</span>
                </a>
            </li>
                <li>
                    <a href="<%=Config.getInstance().getString("default.urlheader")%>/Feedback/feedback-page.jsp">
                        <i class="fas fa-info-circle"></i>
                        <span class="nav-text">用户反馈</span>
                    </a>
                </li>

                <%if (user.permission.equals("superhigh") || user.permission.equals("high")) {%>
                <li>
                    <a href="<%=Config.getInstance().getString("default.urlheader")%>/Feedback/feedback.jsp">
                        <i class="fas fa-info-circle"></i>
                        <span class="nav-text">管理/回复反馈</span>
                    </a>
                </li>
                <%}%>

            <%if (user.permission.equals("superhigh")) {%>
            <li>
                <a href="<%=Config.getInstance().getString("default.urlheader")%>/superadmin/users.jsp">
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

