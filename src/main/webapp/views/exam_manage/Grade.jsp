
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <%@include file="../../common.jsp" %>
    <title>贵美后台管理系统</title>
    <script src="js/jquery-2.2.4.js"></script>
    <script src="js/echarts/echarts.simple.min.js"></script>
    <script src="js/bootstrap_v3.3.7/css/bootstrap-theme.min.css"></script>

    <script type="text/javascript">
        function clock() {
            var time = new Date();
            time = time.toLocaleTimeString();
            document.getElementById('h5').innerHTML=time;
        }
        setInterval(clock, 1000);
    </script>
    <script>
        $(function () {
            $.get("score/totalExamNumber",{},function (resp) {
                var select = $('#test');
                $.each(resp,function (i, e) {
                    var opt = new Option(e.exam_no,e.exam_no);
                    select.append(opt);
                })
            })
        })
    </script>
</head>

<body>

<div id="wrapper">

    <%--此处包含左侧--%>
    <%@include file="../../main_left.jsp" %>

    <div id="page-wrapper" class="gray-bg">
        <%--此处包含头部信息--%>
        <div class="row border-bottom">
            <%@include file="../../main_top.jsp" %>
        </div>
        <!--头部导航窗口自定义对应每个界面 如 首页/商品管理/员工详细/自己给超链接-->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>导航</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="../../welcome.jsp">首页</a>
                    </li>
                    <li>
                        <a>用户管理</a>
                    </li>
                    <li class="active">
                        <strong>用户信息批量操作</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2" id="h5">
            </div>
        </div>

        <div class="row wrapper wrapper-content animated fadeInRight">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>修改我的信息</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>

                    <div class="ibox-content" id="aaa">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title text-left"><span class="fa fa-bar-chart-o"></span> &nbsp;学生用户信息
                                </h3>
                            </div>
                            <div class="panel-body">
                                <%--*********--%>
                                    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
                                    <div id="main" style="width: 1000px;height:400px;">
                                        <script type="text/javascript">
                                            // 基于准备好的dom，初始化echarts实例
                                            var myChart = echarts.init(document.getElementById('main'));

                                            // 指定图表的配置项和数据
                                            option = {
                                                tooltip : {
                                                    trigger: 'axis',
                                                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                                                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                                                    }
                                                },
                                                grid: {
                                                    left: '3%',
                                                    right: '4%',
                                                    bottom: '3%',
                                                    containLabel: true
                                                },
                                                xAxis : [
                                                    {
                                                        type : 'category',
                                                        data : ['正在等待导入数据...']
                                                    }
                                                ],
                                                yAxis : [
                                                    {
                                                        type : 'value'
                                                    }
                                                ],
                                                series : [
                                                    {
                                                        name:'考试次数',
                                                        type:'bar',
                                                        data:[0]
                                                    }
                                                ]
                                            };
                                            // 使用刚指定的配置项和数据显示图表。
                                            myChart.setOption(option);
                                        </script>
                                    </div>

                                    <script type="text/javascript">
                                        $(function () {
                                            $('#fff').click(function () {
                                                var testvalue = $('#test').val();
                                                $.get("score/totalScore",{"examNo":testvalue},function (resp) {
                                                    var score=[];
                                                    $.each(resp, function (i, v) {
                                                       score.push(v.allScore);
                                                    });
                                                    myChart.setOption(
                                                        {
                                                            xAxis : [
                                                                {
                                                                    type : 'category',
                                                                    data : ['优秀','良好','中等','及格','不及格']
                                                                }
                                                            ],
                                                            yAxis : [
                                                                {
                                                                    type : 'value'
                                                                }
                                                            ],
                                                            series :[
                                                                {
                                                                    name:'考试次数',
                                                                    type:'bar',
                                                                    data:score
                                                                }
                                                            ]
                                                        }
                                                    );
                                                });
                                            })
                                        })
                                    </script>
                                    <div style="margin-left: 500px">
                                        <button class="btn btn-primary dim" type="button" id="fff"><i class="fa fa-check"></i>查询成绩</button>
                                        <select id="test">
                                            <option value="">请选择</option>
                                        </select>
                                    </div>
                                <%--*********--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--结尾信息-->
        <div class="footer">
            <div class="pull-right" style="font-size: 12px">
                贵美<strong>后台</strong> 管理系统
            </div>
            <div style="font-size: 12px">
                烧脑分队 倾情奉献 &copy; 2018-2019
            </div>
        </div>
    </div>
</div>

<%--update--%>
<div class="container">
    <!-- 模态框 -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

            </div>
        </div>
    </div>
</div>
</body>

</html>
