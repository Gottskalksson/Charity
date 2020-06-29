$(function () {

    $(".bagsNextStep").click(function () {

        var bagsQuantity = $("#quantity").val();
        $("#summaryBag").text("sztuk: " + bagsQuantity);

        console.log(bagsQuantity);

    });

    $(".radioNextStep").click(function () {

        var radioValue = $("input[name='institution']:checked").siblings().children("div.title").text();

        $("#summaryInstitution").text("dla fundacji " + radioValue);
        console.log(radioValue);

    });


});
