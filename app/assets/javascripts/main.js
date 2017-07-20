$.extend( $.fn.dataTable.defaults, {
  language: {
    processing:     "处理中...",
    search:         "搜索:",
    lengthMenu:    "显示 _MENU_ 项结果",
    info:           "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
    infoEmpty:      "显示第 0 至 0 项结果，共 0 项",
    infoFiltered:   "(由 _MAX_ 项结果过滤)",
    infoPostFix:    "",
    loadingRecords: "载入中...",
    zeroRecords:    "没有匹配结果",
    emptyTable:     "表中数据为空",
    paginate: {
        first:      "首页",
        previous:   "上页",
        next:       "下页",
        last:       "末页"
    },
    aria: {
        sortAscending:  ": 以升序排列此列",
        sortDescending: ": 以降序排列此列"
    }
  }
});

function toggle(switch_element) {
    if(switch_element.hasClass("fold")) {
        switch_element.removeClass("fold");
        switch_element.addClass("unfold");
        switch_element.html('<span class="glyphicon glyphicon-chevron-up"></span>');
    } else {
        switch_element.removeClass("unfold");
        switch_element.addClass("fold");
        switch_element.html('<span class="glyphicon glyphicon-chevron-down"></span>');
    }
}

$(document).ready(function(){
    $('.datatable').dataTable();
    $(".clickableRow").click(function() {
        window.document.location = $(this).find("a").first().attr("href");
    });
    $('.well').find('input, textarea, select').attr('disabled','true');

    $(".toggle_display").hide();
    $('.toggle_switch').click(function(){
      toggle($(this));
      $(".toggle_display").toggle();
    });
});