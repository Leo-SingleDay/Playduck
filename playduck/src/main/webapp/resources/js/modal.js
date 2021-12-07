$(function () {
    $(".modal_joinBtn").click(function () {
        $(".modal_join").fadeIn();
    });
    $(".modal_content_close").click(function () {
        $(".modal_join").fadeOut();
    });
});

$(document).ready(function () {
    $('.modal_join').append('<style type="text/css">.modal {max-height: ' + ($('body').height() * .8) +
        'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>');
});

$(function () {
		    $(".modal_loginBtn").click(function () {
		        $(".modal_login").fadeIn();
		    });
		    $(".modal_content_close").click(function () {
		        $(".modal_login").fadeOut();
		    });
		});

		$(document).ready(function () {
		    $('.modal_login').append('<style type="text/css">.modal {max-height: ' + ($('body').height() * .8) +
		        'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>');
		});
		
$(function () {
    $("#login_joinBtn").click(function () {
        $(".modal_join").fadeIn();
        $(".modal_login").fadeOut();
    });
    $(".modal_content_close").click(function () {
        $(".modal_join").fadeOut();
    });
});

$(document).ready(function () {
    $('.modal_join').append('<style type="text/css">.modal {max-height: ' + ($('body').height() * .8) +
        'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>');
});

$(function () {
    $("#modal_findBtn").click(function () {
        $(".modal_find").fadeIn();
        $(".modal_login").fadeOut();
    });
    $(".modal_content_close").click(function () {
        $(".modal_find").fadeOut();
    });
});

$(document).ready(function () {
    $('.modal_find').append('<style type="text/css">.modal {max-height: ' + ($('body').height() * .8) +
        'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>');
});



$(function () {
    $(".Mypage_update_button").click(function () {
        $(".modal_profileModify1").fadeIn();
    });
    $(".close1").click(function () {
        $(".modal_profileModify").fadeOut();
    });
    $(".close2").click(function () {
        $(".modal_profileModify1").fadeOut();
    });
    $(".close3").click(function () {
        $(".modal_profileModify2").fadeOut();
    });
    $(".close4").click(function () {
        $(".modal_profileModify3").fadeOut();
    });
});

$(document).ready(function () {
    $('.modal_profileModify').append('<style type="text/css">.modal {max-height: ' + ($('body').height() * .8) +
        'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>');
});


$(function () {
    $(".header_search").click(function () {
        $(".modal_search").fadeIn();
    });
    $(".modal_content_close").click(function () {
        $(".modal_search").fadeOut();
    });
});

$(document).ready(function () {
    $('.modal_search').append('<style type="text/css">.modal {max-height: ' + ($('body').height() * .8) +
        'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>');
});


$(function () {
    $(".list_sort").click(function () {
        $(".madal_listSort").fadeIn();
    });
    $(".modal_content_close_1").click(function () {
        $(".madal_listSort").fadeOut();
    });
});

$(document).ready(function () {
    $('.madal_listSort').append('<style type="text/css">.modal {max-height: ' + ($('body').height() * .8) +
        'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>');
});

