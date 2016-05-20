/**
 * @author zhixin wen <wenzhixin2010@gmail.com>
 * extensions: https://github.com/kayalshri/tableExport.jquery.plugin
 */

(function ($) {
    'use strict';

    $.extend($.fn.bootstrapTable.defaults, {
        exportExcelText: "导出Excel数据",
        showExportExcel: false,
        exportExcelDataType: 'basic', // basic, all, selected
        exportExcelOptions: {}
    });

    var BootstrapTable = $.fn.bootstrapTable.Constructor,
        _initToolbar = BootstrapTable.prototype.initToolbar;

    BootstrapTable.prototype.initToolbar = function () {
        this.showToolbar = this.options.showExportExcel;

        _initToolbar.apply(this, Array.prototype.slice.apply(arguments));

        if (this.options.showExportExcel) {
            var that = this,
                $btnGroup = this.$toolbar.find('>.btn-group'),
                $export = $btnGroup.find('div.export');

            if (!$export.length) {
                $export = $([
                    '<div class="export btn-group">',
                    '<button class="btn btn-default" type="button">',
                    this.options.exportExcelText,
                    '</button>',
                    '</div>'].join('')).appendTo($btnGroup);

                $export.click(function () {
                    var doExport = function () {
                        that.$el.tableExport($.extend({}, that.options.exportExcelOptions, {
                            type: "excel",
                            escape: false
                        }));
                    };

                    if (that.options.exportExcelDataType === 'all' && that.options.pagination) {
                        that.$el.one('load-success.bs.table page-change.bs.table', function () {
                            doExport();
                            that.togglePagination();
                        });
                        that.togglePagination();
                    } else if (that.options.exportExcelDataType === 'selected') {
                        var data = that.getData(),
                            selectedData = that.getAllSelections();

                        that.load(selectedData);
                        doExport();
                        that.load(data);
                    } else {
                        doExport();
                    }
                });
            }
        }
    };
})(jQuery);
