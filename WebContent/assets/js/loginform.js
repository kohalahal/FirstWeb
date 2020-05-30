var form = $("form")[0];

$(".login-button").click(function (event) {
  event.preventDefault();
});

$(".login-button").click(function () {
  if (form[0].value == "") {
    alert("ID를 입력하세요.");
    return false;
  } else if (form[1].value == "") {
    alert("비밀번호를 입력하세요.");
    return false;
  } else {
    $(".loading-spinner-large").css("display", "block");
    $(".loading-spinner-small").css("display", "block");
    $(".login-form").css("transform", "rotateY(-180deg)");
    $(".loading").css("transform", "");
    var delay = 1500;
    setTimeout(function () {
      $("form").attr("action", "LoginAction").submit();
    }, delay);
  }
});

function initiateLogin() {
  $(".login-form").css("transform", "");
}

function initiateError() {
  $(".loading").css("transform", "");
}

$(".return-button").click(function () {
  $(".loading").css("transform", "rotateY(-180deg)");
  $(".login-form").css("transform", "");
  $(".login-message").css("display", "none");
});