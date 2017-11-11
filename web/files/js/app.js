/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$('document').ready(function () {

});

function formatString() {
    // The string containing the format items (e.g. "{0}")
    // will and always has to be the first argument.
    var theString = arguments[0];
    
    // start with the second argument (i = 1)
    for (var i = 1; i < arguments.length; i++) {
        // "gm" = RegEx options for Global search (more than one instance)
        // and for Multiline search
        var regEx = new RegExp("\\{" + (i - 1) + "\\}", "gm");
        theString = theString.replace(regEx, arguments[i]);
    }
    
    return theString;
}

function load_wait_list() {
    $.ajax({
        method: "POST",
        url: "getListCook.action",
        dataType: "json"
    })
            .done(function (data) {
                console.log('Successful AJAX Call! /// Return Data: ' + data.toString());
                if (data.error != 0) {
                    console.log('Error from server!');
                    return;
                }
                data = data.data;
                
                if (data.list == null || data.list.length == 0) {
                    return;
                }
                
                $('#wait_list').removeClass('empty-table');
                $('.empty-alert').fadeOut();
                
                wait_list_tbody = $('#wait_list tbody');
                temp_string = 
                '<tr id="item_cooking_{0}">\
                        <td>{1}</td>\
                        <td>{2}</td>\
                        <td>{3}</td>\
                        <td>\
                            <form id="UpdateChefId" name="UpdateChefId" action="UpdateChefId.action">\
                                <input type="submit" value="Cook" class="btn btn-primary"/>\
                                <input type="hidden" name="id" value="{0}"/>\
                            </form>\
                        </td>\
                </tr>';
                count = wait_list_tbody.children().length;
                console.log('Count ' + count);
                for (var i = 0; i < data.list.length; i++) {
                    if ($('#item_cooking_' + data.list[i].ID).length === 0) {
                        element = formatString(temp_string,
                        data.list[i].ID,
                        ++count,
                        data.list[i].name,
                        data.list[i].orderTimeStr
                        );
                        wait_list_tbody.append(element);
                    }
                }

            })
            .fail(function (data) {
                console.log('Failed AJAX Call :( /// Return Data: ' + data.toString());
            })
            .always(function () {
                setTimeout(load_wait_list, 1000);
            })
            ;
}


function load_ready_list() {
    $.ajax({
        method: "POST",
        url: "getReadyList.action",
        dataType: "json"
    })
            .done(function (data) {
                console.log('Successful AJAX Call! /// Return Data: ' + data.toString());
                if (data.error != 0) {
                    console.log('Error from server!');
                    return;
                }
                data = data.data;
                
                if (data.list == null || data.list.length == 0) {
                    return;
                }
                
                $('#ready_list').removeClass('empty-table');
                $('.empty-alert').fadeOut();
                
                ready_list_tbody = $('#ready_list tbody');
                temp_string = 
                '<tr id="item_ready_{0}">\
                    <td>{1}</td>\
                    <td>{2}</td>\
                    <td>\
                        <form id="takeFood" name="takeFood" action="/Restaurant/waiter/takeFood.action" method="post">\
                            <input type="submit" id="takeFood_0" value="Take" class="btn btn-success"/>\
                            <input type="hidden" name="id" value="{0}" id="takeFood_id"/>\
                        </form>\
                    </td>\
                </tr>';
                count = ready_list_tbody.children().length;
                console.log('Count ' + count);
                for (var i = 0; i < data.list.length; i++) {
                    if ($('#item_ready_' + data.list[i].ID).length === 0) {
                        element = formatString(temp_string,
                        data.list[i].ID,
                        ++count,
                        data.list[i].name
                        );
                        ready_list_tbody.append(element);
                    }
                }

            })
            .fail(function (data) {
                console.log('Failed AJAX Call :( /// Return Data: ' + data.toString());
            })
            .always(function () {
                setTimeout(load_ready_list, 1000);
            })
            ;
}

//Tab content
function openTab(evt, tabName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
}