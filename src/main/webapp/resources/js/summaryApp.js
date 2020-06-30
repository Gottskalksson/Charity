$(function () {

    $(".bagsNextStep").click(function () {

        var bagsQuantity = $("#quantity").val();
        $("#summaryBag").text("sztuk: " + bagsQuantity);


    });

    $(".radioNextStep").click(function () {

        var radioValue = $("input[name='institution']:checked").siblings().children("div.title").text();

        $("#summaryInstitution").text("dla fundacji " + radioValue);


    });

    $(".detailsNextStep").click(function () {

        var street = $("#street").val();
        $("#summaryStreet").text(street);

        var city = $("#city").val();
        $("#summaryCity").text(city);

        var zipCode = $("#zipCode").val();
        $("#summaryZipCode").text(zipCode);

        var phoneNumber = $("#phoneNumber").val();
        $("#summaryPhone").text(phoneNumber);

        var pickUpDate = $("#pickUpDate").val();
        $("#summaryPickUpDate").text(pickUpDate);

        var pickUpTime = $("#pickUpTime").val();
        $("#summaryPickUpTime").text(pickUpTime);

        var comments = $("#pickUpComment").val();
        if (comments.length === 0) {
            $("#summaryCommentary").text("Brak uwag");
        } else {
            $("#summaryCommentary").text(comments);
        }
    });


});
