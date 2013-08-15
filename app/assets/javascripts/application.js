// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$( document ).ready(function() {
 
    // $("a").click(function(event){
    // 	$(this).hide("slow");
    // 	event.preventDefault();
    	
    // });


    // $("p").css("border", "3px solid red");

    // $("#sayhello").click(function(event){
    // 	alert("Say Hello!!");
    // });

    // $("p").on("click", {foo: "bar"}, function(event){
    // 	alert("event data: is " + event.data.foo);
    // });

    $('#testtip').tooltip({
        title: "title"
    });

    // $('#new_portfolio a').on("click", function(){
    //     $.getScript(this.href);
    //     return false;
    // });
        // $("#loading").hide();

        $('#newtradebutton').click(function(){
            $.ajax({
              type: "GET",
              url: "/portfolios/1/trades/new",
              dataType: "script"
            });
        });

        $('#showtradesbutton').click(function(){
            // $("#showtrades").html("show trades box");
            alert("hi");
            $.ajax({
              type: "GET",
              url: "/portfolios/1/trades",
              dataType: "script"
            });
         });

        $('#showtradesbutton').on('ajax:beforeSend', function(event, xhr, settings) {
          $("#loading").show();
        });

        

        $("#showtradesbutton").on('ajax:success', function(evt, data, status, xhr){
            $("#loading").hide();
        });



        // $('#portfolio_<%= portfolio.id %>').click(function(){
        //     $.ajax({
        //       type: "GET",
        //       url: "/portfolios/new",
        //       dataType: "script"
        //     });
        // });
});

