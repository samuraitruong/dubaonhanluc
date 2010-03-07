$(document).ready(function () {
    GridDemo.Home.GridData.setupGrid($("#grid"), $("#pager"));
});

GridDemo.Home.GridData = {
    setupGrid: function (grid, pager) {
        var lastsel;
        grid.jqGrid({
            url: "GridData/List",
            mtype: "get",
            datatype: "json",
            colNames: ['Product ID', 'Product Name', 'Unit Price', 'Discontinued'],
            colModel: [
                        { name: 'ProductID', index: 'ProductID', width: 50, align: 'center', sortable: false, editable: false, hidden: false },
                        { name: 'ProductName', index: 'ProductName', sortable: true, editable: false, hidden: false },
                        { name: 'UnitPrice', index: 'UnitPrice', width: 40, align: 'center', formatter: 'currency', formatoptions: { prefix: "$" }, sortable: true, editable: false, hidden: false },
                        { name: 'Discontinued', index: 'Discontinued', width: 50, align: 'center', sortable: false, hidden: false }
                      ],
            rowNum: 10,
            rowList: [10, 20, 30],
            pager: pager,
            sortname: 'ProductID',
            sortorder: "asc",
            viewrecords: true,
            width: '100%',
            height: '100%',
            autowidth: true,
            rownumbers: true,
            caption: 'Grid Data Example'
        })
        .navGrid(pager, { edit: false, add: false, del: false, search: false });
    }
};