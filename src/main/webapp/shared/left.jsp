<%@ page pageEncoding="UTF-8"%>

<section class="sidebar">
	<div class="user-panel">
		<div class="pull-left image">
			<img src="${basePath }/static/images/user2-160x160.jpg" class="img-circle" alt="User Image">
		</div>
		<div class="pull-left info">
			<p>${staff_name }</p>
			<a href="#">
				<i class="fa fa-circle text-success"></i>
				Online
			</a>
		</div>
	</div>

	<ul class="sidebar-menu">
		<li class="active treeview">
			<a href="#">
				<i class="fa fa-dashboard"></i>
				<span>人事管理</span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li>
					<a href="javascript:loadMainPage('${basePath }/Staff/listStaff')">
						<i class="fa fa-circle-o"></i>
						员工信息
					</a>
				</li>
				<li>
					<a href="javascript:loadMainPage('${basePath }/Offer/listOffer')">
						<i class="fa fa-circle-o"></i>
						供货商信息
					</a>
				</li>
			</ul>
		</li>
		<li class="treeview">
			<a href="#">
				<i class="fa fa-dashboard"></i>
				<span>销售管理</span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li>
					<a href="javascript:loadMainPage('${basePath }/Staff/listStaff')">
						<i class="fa fa-circle-o"></i>
						销售信息
					</a>
				</li>
				<li>
					<a href="javascript:loadMainPage('${basePath }/Staff/')">
						<i class="fa fa-circle-o"></i>
						员工考勤
					</a>
				</li>
				<li>
					<a href="javascript:loadMainPage('${basePath }/Staff/')">
						<i class="fa fa-circle-o"></i>
						员工卡片
					</a>
				</li>
			</ul>
		</li>
		<li class="treeview">
			<a href="#">
				<i class="fa fa-dashboard"></i>
				<span>进货管理</span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li>
					<a href="javascript:loadMainPage('${basePath }/Admin/listSysUser')">
						<i class="fa fa-circle-o"></i>
						进货信息
					</a>
				</li>
				<li>
					<a href="javascript:loadMainPage('${basePath }/Admin/listCard')">
						<i class="fa fa-circle-o"></i>
						进货新增
					</a>
				</li>

			</ul>
		</li>
		<li class="treeview">
			<a href="#">
				<i class="fa fa-dashboard"></i>
				<span>库存管理</span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li>
					<a href="javascript:loadMainPage('${basePath }/Admin/listSysUser')">
						<i class="fa fa-circle-o"></i>
						库存信息
					</a>
				</li>
			</ul>
		</li>
	</ul>
</section>