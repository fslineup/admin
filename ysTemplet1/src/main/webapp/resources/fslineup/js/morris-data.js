$(function() {
    Morris.Donut({
        element: 'morris-donut-chart',
        data: [{
            label: "Download Sales",
            value: 0
        }, {
            label: "In-Store Sales",
            value: 41
        }, {
            label: "Mail-Order Sales",
            value: 60
        }],
        resize: true
    });
});
