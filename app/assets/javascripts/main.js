$.extend( $.fn.dataTable.defaults, {
  pageLength : 25,
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


accounting.settings = {
    currency: {
        symbol : "￥",   // default currency symbol is '$'
        format: "%s%v", // controls output: %s = symbol, %v = value/number (can be object: see below)
        decimal : ".",  // decimal point separator
        thousand: ",",  // thousands separator
        precision : 2   // decimal places
    },
    number: {
        precision : 0,  // default precision on numbers is 0
        thousand: ",",
        decimal : "."
    }
}

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

function parseNumber(value) {
  return Number(value) ? Number(value) : 0;
}

function formatMoneyInTable() {
  $("td.money").each(function() {
    $(this).html(accounting.formatMoney($(this).html()));
  });
}

function parseCurrency(td) {
  return accounting.unformat(td.html());
}

function sumCurrency(amounts) {
  var sum = 0;
  amounts.each(function() {
    amount = parseCurrency($(this));
    sum += amount;
  });
  return sum;
}

function sumAndFormat(amounts) {
  var sum = 0;
  amounts.each(function() {
    amount = parseCurrency($(this));
    sum += amount;
  });
  return accounting.format(sum);
}

function changeClassToDanger(ele) {
  if(ele.prop('tagName').toUpperCase() == "INPUT") {
    ele = ele.parent("td");
  }
  ele.removeClass("success");
  ele.addClass("danger");
}

function changeClassToSuccess(ele) {
  if(ele.prop('tagName').toUpperCase() == "INPUT")
    ele = ele.parent("td");
  ele.removeClass("danger");
  ele.addClass("success");
}

$(document).ready(function(){
    $('.go-back').click(function(){
        window.history.back();
    });
    
    $('.datatable').dataTable();
    $(".clickableRow").click(function() {
        window.document.location = $(this).find("a").first().attr("href");
    });
    $('.well').find('input, textarea, select').attr('disabled','true');

    formatMoneyInTable();

    $(".toggle_display").hide();
    $('.toggle_switch').click(function(){
      toggle($(this));
      $(".toggle_display").toggle();
    });


    // auto focus first input EXCEPT expense and reimbursment form
    $(":text:visible:enabled:not([readonly]):first").not("form.disable_auto_focus input").focus();
});