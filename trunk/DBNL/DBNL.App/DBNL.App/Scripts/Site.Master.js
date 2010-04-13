﻿$(document).ready(function() {
    GridDemo.SiteMaster.setDefaults();
});

var DBNL = {
    Admin: {
        Links: {},
        Banner: {},
        Contact: {},
        Poll: {},
        Categories: { Articles: {} },
        Articles: {},
        Navigations :{},
        Supporters:{}
    },
    SiteMaster: {
        setDefaults: function () {
            $.jgrid.defaults = $.extend($.jgrid.defaults, {
                datatype: 'json',
                height: 'auto',
                imgpath: '/Content/jqGrid3.6.4/images',
                jsonReader: {
                    root: "Rows",
                    page: "Page",
                    total: "Total",
                    records: "Records",
                    repeatitems: false,
                    userdata: "UserData",
                    id: "Id"
                },
                loadui: "block",
                mtype: 'POST',
                multiboxonly: true,
                rowNum: 20,
                rowList: [10, 20, 50],
                viewrecords: true,
                pgtext: "Pagex {0} of {1}"

            });
        }
    }
};

var GridDemo = {
    Home: {
        GridDemo: {}
    },
    SiteMaster: {
        setDefaults: function () {
            $.jgrid.defaults = $.extend($.jgrid.defaults, {
                datatype: 'json',
                height: 'auto',
                imgpath: '/Content/jqGrid3.6.4/images',
                jsonReader: {
                    root: "Rows",
                    page: "Page",
                    total: "Total",
                    records: "Records",
                    repeatitems: false,
                    userdata: "UserData",
                    id: "Id"
                },
                loadui: "block",
                mtype: 'GET',
                multiboxonly: true,
                rowNum: 20,
                rowList: [10, 20, 50],
                viewrecords: true
            });
        }
    }
};
function imageFormater(cellvalue, options, rowObject) {
    return "<img src='" + cellvalue + "' width='75' height='54' />";

}
function urlFormater(cellvalue, options, rowObject) {
    return "<a href='" + cellvalue + "'  >" + cellvalue+"</a>";

}
function customCheckboxFormater(cellvalue, options, rowObject) {
    return "<input type='checkbox' name='" + cellvalue + "' id='" + cellvalue + "'/>";
}


