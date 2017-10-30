<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>wizard</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/wizard/wizardS2.js"></script>
</head>
<body>
<form method="post" name="springForm" enctype="multipart/form-data" 
	<c:if test="${empty vwResolverInfo}">
		action="${pageContext.request.contextPath}/wizard/insertSpringInfo.do"
	</c:if>
	<c:if test="${!empty vwResolverInfo}">
		action="${pageContext.request.contextPath}/wizard/updateSpringInfo.do"
	</c:if>
	>
	<input type ="hidden" name="pr_ibatis_type" id="ibatis_type">
	<input type ="hidden" name="pr_auto_cmmt_yn" id="auto" value="N">
	<input type ="hidden" name="pr_reslv_tiles_yn" id="tiles_yn">
	<input type ="hidden" name="pr_reslv_inter_yn" id="inter_yn">
	<input type ="hidden" name="pr_reslv_file_yn" id="file_yn" value="N">
	<input type ="hidden" name="pr_quar_expsn" id="quartz_ex" value="">
	<section id="section" class="container">
		<div class="center">
	      <ul class="procedure">
	         <li id="projectNav" class="nav-unselect">Project</li>
	         <li id="mavenNav" class="nav-unselect">Maven</li>
	         <li id="springNav" class="nav-select">Spring</li>
	         <li id="generatorNav" class="nav-unselect">Generator</li>
	      </ul>
   		</div>
   		<div class="form-horizontal well bs-component minScreen">
			<div class="left-nav">
				<ul>
					<li class="springNavUn">web.xml</li>				
					<li class="springNav">SpringConf</li>
				</ul>
			</div>
   			<div class="springTbl panel-group" id="accordion1">
              <table>
               	<tr><!-- ibatis tr  -->
				   <td>
			           <div class="panel panel-default">
                           <div id="div1" class="panel-heading active">
                             <h3 class="panel-title">
                              <input id="ibatis" type="checkbox" class="invisible ckb" checked disabled
							  />
							  <label for="ibatis" class="side-label"></label>
                               <a id="a1" class="collapsed" data-toggle="collapse" data-parent="#accordion1" href="" >
                                 iBatis
                                 <i id="i1" class="fa fa-angle-right pull-right iStyle" style="display:none; line-height: 44px;"></i>
                               </a>
                             </h3>
                           </div>
                           <div id="collapseIbatis" class="panel-collapse collapse" style="height: 0px;">
                             <div class="panel-body" style="background-color:#000;">
								<input id="jndi" name="how" type="radio" class="ckb none" 
								<c:if test="${ibatisInfo.pr_ibatis_type eq 'jndi' || empty ibatisInfo.pr_ibatis_type }">
									 checked="checked"
								</c:if>
								>
								<label for="jndi" class="side-label">JNDI</label>
							
								<input id="dbcp" name="how" type="radio" class="ckb none"
								<c:if test="${ibatisInfo.pr_ibatis_type eq 'dbcp'}">
									 checked="checked"
								</c:if>
								>
								<label for="dbcp" class="side-label">DBCP</label>
                             </div>
                           </div>
                         </div>
					</td>
				</tr><!-- ibatis tr end  -->
				<tr><!-- 뷰리졸버 tr 시작  -->
					<td>
			           <div class="panel panel-default">
                           <div id="div2" class="panel-heading active">
                             <h3 class="panel-title">
                              <input id="vwResolver" type="checkbox" class="invisible ckb" checked disabled
							  />
							  <label for="vwResolver" class="side-label"></label>
                               <a id="a2" class="collapsed" data-toggle="collapse" data-parent="#accordion1" href="">
                                 View Resolver
                                 <i id="i2" style="display:none; line-height: 44px;" class="fa fa-angle-right pull-right iStyle"></i>
                               </a>
                             </h3>
                           </div>
                           <div id="collapseVwResolver" class="panel-collapse collapse" style="height: 0px;">
                             <div class="panel-body" style="background-color:#000;">
							<input id="internalView" name="viewResolver" type="radio" class="ckb none" 
							<c:if test="${vwResolverInfo.pr_reslv_inter_yn eq 'Y' || empty vwResolverInfo.pr_no}">
							 checked="checked"
							</c:if>
							>
							<label for="internalView" class="side-label2">Internal
								Resource View Resolver</label>
								
							<input id="tiles" name="viewResolver" type="radio" class="ckb none" 
							<c:if test="${vwResolverInfo.pr_reslv_tiles_yn eq 'Y'}">
							 checked="checked"
							</c:if>
							>
							<label for="tiles" class="side-label2">Tiles</label>
							<div id="internal_area" align="right" 
							style="width:250px; height:110px;  
								<c:if test="${vwResolverInfo.pr_reslv_tiles_yn eq 'Y'}">
									display:none
								</c:if>
							">
								<table >
									<tr>
										<td style="padding:15px 5px 5px 5px;" align="center"><font class="vwfont">view prefix</font></td>
										<td style="padding:15px 5px 5px 5px;">
										<input id="prefix" name="pr_reslv_pre"
										style="width: 130px;" class="i_text" type="text" 
										<c:if test="${vwResolverInfo.pr_reslv_inter_yn eq 'Y'}">
										 value="${vwResolverInfo.pr_reslv_pre}"
										</c:if>
										value="/WEB-INF/view"/> 
										</td>
									</tr>
									<tr>
										<td style="padding:5px 5px 5px 5px;" align="center"><font class="vwfont">view suffix</font></td>
										<td style="padding:5px 5px 5px 5px;">
										<input id="suffix" name="pr_reslv_suf"
										style="width: 130px;" class="i_text" type="text" 
										<c:if test="${vwResolverInfo.pr_reslv_inter_yn eq 'Y'}">
										 value="${vwResolverInfo.pr_reslv_suf}"
										</c:if>
										value=".jsp" /> 
										</td>
									</tr>
								</table>
							</div><!--internal View Resolver의 hidden area end  -->
                             </div>
                           </div>
                         </div>
					</td>
				</tr><!-- 뷰리졸버 tr end  -->
				<tr><!-- 파일 tr  -->
					<td>
                         <div class="panel panel-default">
                           <div id="div3" class="panel-heading active panel-Gray">
                             <h3 class="panel-title">
	                            <input id="file" type="checkbox" class="invisible ckb" 
									<c:if test="${vwResolverInfo.pr_reslv_file_yn eq 'Y'}">
											checked="checked"
									</c:if>
								/>
								<label for="file" class="side-label"></label>
         						 <a id="a3" class="collapsed file" data-toggle="collapse"  data-parent="#accordion1" href="#">
                                	File
                                 <i id="i3" style="display:none;" class="fa fa-angle-right pull-right iStyle"></i>
                               </a>
                             </h3>
                           </div>

                           <div id="collapseFile" class="panel-collapse collapse" style="height: 0px;">
                             <div class="panel-body">
                                 <div class="media accordion-inner">
                                       <div class="pull-left">
                                           <img class="img-responsive" src="images/accordion1.png">
                                       </div>
                                       <div class="media-body">
                                            <h4>Adipisicing elit</h4>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore</p>
                                       </div>
                                 </div>
                             </div>
                           </div>
                         </div>
					</td>
				</tr><!-- file tr end  -->
				<tr><!-- 쿼츠  tr 시작  -->
					<td>
						<div class="panel panel-default">
                            <div id="div4" class="panel-heading active">
                              <h3 class="panel-title">
                              	<input id="quartz" name="quartzCkb" type="checkbox" class="invisible ckb" 
	                              	<c:if test="${!empty quartzInfo}">
											checked="checked"
									</c:if>
                              	/>
							  	<label for="quartz" class="side-label"></label>	
                                <a id="a4" class="collapsed" data-toggle="collapse" data-parent="#accordion1" href="#">
                                  Quartz
                                  <i id="i4" style="display:none; line-height: 44px;" class="fa fa-angle-right pull-right iStyle"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseQuartz" class="panel-collapse collapse" style="height: 0px;">
                              <div class="panel-body" style="background-color:#000;">
                              <!-- 쿼츠 내용 쿼츠 내용 쿼츠 내용 쿼츠 내용 쿼츠 내용 쿼츠 내용 쿼츠 내용 쿼츠 내용 쿼츠 내용 쿼츠 내용 쿼츠 내용 -->
                              	<section style="background-color: #000000; height:180px;" class="scrollView" >	<!--   display:none -->			
									<table>
										<tr>
											<td>
												<div style="font-size:15px; font-weight: bold;"> 1. Name of Quartz Class
												<input style="width: 100px; height:20px; margin-left:10px;" 
												name="pr_quar_cls_nm" id="qz_name" class="i_text" type="text" 
												<c:if test="${!empty quartzInfo}">
													value="${quartzInfo.pr_quar_cls_nm}"
												</c:if>
												<c:if test="${empty quartzInfo}">
													value=""
												</c:if>
												></div> 
											</td>
										</tr>
										<tr style="border-top:1px solid #fff; padding-top:10px;">
											<td>
												<div style="padding-top:8px; font-size:15px; font-weight: bold;"> 2. Path of Quartz Class
												<input style="width: 100px; height:20px; margin-left:20px;" 
												name="pr_quar_cls_path" id="qz_path" class="i_text" type="text" 
												<c:if test="${!empty quartzInfo}">
													value="${quartzInfo.pr_quar_cls_path}"
												</c:if>
												<c:if test="${empty quartzInfo}">
													value=""
												</c:if>
												></div> 
											</td>
										</tr>
										<tr style="border-top:1px solid #fff;">
											<td>
												<div style="padding-top:8px; font-size:15px; font-weight: bold;"> 3. Time Expression</div> 
											</td>
										</tr>
										<tr>
											<td>
												<input id="btn_time" type="radio" name="time_expression" class="none"
												<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'user') || empty quartzInfo.pr_quar_expsn}">
													checked="checked"
												</c:if>
												> 
												<label for="btn_time" class="side-label">set time schedule</label>
											</td>
										</tr>
										<tr>
											<td class="padding14">
												<a id="minutes" class="new99 time_tab 
													<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'n') || empty quartzInfo.pr_quar_expsn}">
													tab_select" style="font-weight:bold; color: blue99; background-color:#98133E 
													</c:if>
												">minutes</a>
												<a id="hourly" class="new99 time_tab
													<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'h')}">
													tab_select" style="font-weight:bold; color: blue99; background-color:#98133E 
													</c:if>
												">hourly</a>
												<a id="daily" class="new99 time_tab 
													<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'd')}">
													tab_select" style="font-weight:bold; color: blue99; background-color:#98133E 
													</c:if>
												">daily</a> 
												<a id="weekly" class="new99 time_tab
													<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'w')}">
													tab_select" style="font-weight:bold; color: blue99; background-color:#98133E 
													</c:if>
												">weekly</a> 
												<a id="monthly" class="new99 time_tab
													<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'm')}">
													tab_select" style="font-weight:bold; color: blue99; background-color:#98133E 
													</c:if>
												">monthly</a>
												<a id="yearly" class="new99 time_tab
													<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'y')}">
													tab_select" style="font-weight:bold; color: blue99; background-color:#98133E 
													</c:if>
												">yearly</a>
											</td>																
										</tr>
										<tr style="height:30px;">
											<td class="padding14">
												<div id="set_time">
													<!--  minutes  -->
													<div id="minutes_area" class="area time_style"			
														<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'n') || empty quartzInfo.pr_quar_expsn}">
															style="display:block"
														</c:if>
													 >
														<input id="radio_minute" name="how_min" type="radio" class="none"
														<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'n') || empty quartzInfo.pr_quar_expsn}">
															 checked="checked"
														</c:if>
														/>  
														<label for="radio_minute" class="side-label">
														Every <input id="txt_min" style="width: 40px; height:20px;" 
														class="i_text txt_time" type="text" 
														<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'n')}">
															value="${fn:split(fn:split(quartzInfo.pr_quar_expsn, '/')[1], ' ')[0]}"
														</c:if>
														/> minute(s) 
														</label> 
													</div>	
													<!-- hourly -->
													<div id="hourly_area"  class="area time_style"
														<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'h')}">
															style="display:block"
														</c:if>
													 >
														<input id="radio_hour" name="how_hour" type="radio" class="btn_time none"
														<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'h1')}">
															 checked="checked"
														</c:if>
														/>	
														<label for="radio_hour" class="side-label">Every
														<input id="txt_hour" style="width: 40px; height:20px;" 
														class="i_text txt_time" type="text" 
														<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'h1')}">
															value="${fn:split(fn:split(quartzInfo.pr_quar_expsn, '/')[1], ' ')[0]}"
														</c:if>
														/> hours
														</label> 																	
													</div>	
													<!--  daily -->
													<div id="daily_area" class="area time_style"
														<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'd')}">
															style="display:block"
														</c:if>
													 >
														<input id="daily_first" name="how_daily" type="radio" class="btn_time none"
															<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'd1')}">
																 checked="checked"
															</c:if>
														/>	
														<label for="daily_first" class="side-label">Every
														<input id="txt_daily" style="width: 40px; height:20px;" 
														class="i_text txt_time" type="text" 
															<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'd1')}">
																value="${fn:split(fn:split(quartzInfo.pr_quar_expsn, '/')[1], ' ')[0]}"
															</c:if>
														/> day(s)
														</label><br/> 																		
														<input id="daily_second" name="how_daily" type="radio" class="btn_time none"
															<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'd2')}">
																 checked="checked"
															</c:if>
														/>	
														<label for="daily_second" class="side-label">Every Week Day
														</label> 
													</div>
													<!-- weekly  -->
													<div id="weekly_area" class="area weekly_style time_style" 
														<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'w')}">
															style="display:block;"
														</c:if>
													 >
														<table>
															<tr>
																<td>
																	<input id="MON" type="checkbox" class="invisible dayckb btn_time"
																		<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'w')&&fn:contains(quartzInfo.pr_quar_expsn, 'MON')}">
																			checked="checked"
																		</c:if>
																	/>
																	<label for="MON" class="min-side-label" 
																	style="display:inline-block; font-size:12px;" >Monday</label>
																</td>
																<td>
																	<input id="TUE" type="checkbox" class="invisible dayckb btn_time"
																		<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'w')&&fn:contains(quartzInfo.pr_quar_expsn, 'TUE')}">
																			checked="checked"
																		</c:if>
																	/>
																	<label for="TUE" class="min-side-label" 
																	style="display:inline-block; font-size:12px;">Tuesday</label>
																</td>
																<td>
																	<input id="WED" type="checkbox" class="invisible dayckb btn_time"
																		<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'w')&&fn:contains(quartzInfo.pr_quar_expsn, 'WED')}">
																			checked="checked"
																		</c:if>
																	/>
																	<label for="WED" class="min-side-label" 
																	style="display:inline-block; font-size:12px;">Wednesday</label>
																</td>
																	<td><input id="THU" type="checkbox" class="invisible dayckb btn_time"
																		<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'w')&&fn:contains(quartzInfo.pr_quar_expsn, 'THU')}">
																				checked="checked"
																		</c:if>
																	/>
																	<label for="THU" class="min-side-label" 
																	style="display:inline-block; font-size:12px;">Thursday</label>
																</td>
															</tr>
															<tr>
																<td>
																	<input id="FRI" type="checkbox" class="invisible dayckb btn_time"
																		<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'w')&&fn:contains(quartzInfo.pr_quar_expsn, 'FRI')}">
																			checked="checked"
																		</c:if>
																	/>
																	<label for="FRI" class="min-side-label" 
																	style="display:inline-block; font-size:12px;">Friday</label>
																</td>
																<td>
																	<input id="SAT" type="checkbox" class="invisible dayckb btn_time"
																		<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'w')&&fn:contains(quartzInfo.pr_quar_expsn, 'SAT')}">
																			checked="checked"
																		</c:if>
																	/>
																	<label for="SAT" class="min-side-label" 
																	style="display:inline-block; font-size:12px;">Saturday</label>
																</td>
																<td>
																	<input id="SUN" type="checkbox" class="invisible dayckb btn_time"
																		<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'w')&&fn:contains(quartzInfo.pr_quar_expsn, 'SUN')}">
																			checked="checked"
																		</c:if>
																	/>
																	<label for="SUN" class="min-side-label" 
																	style="display:inline-block; font-size:12px;">Sunday</label>
																</td>
																<td></td>
															</tr>
														</table>
													</div>
													<!-- monthly -->
													<div id="monthly_area" class="area time_style"
														<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'm')}">
														style="display:block"
														</c:if>
													 >
														<input id="monthly_first" name="how_monthly" type="radio" class="invisible btn_time"
															<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'm1')}">
																 checked="checked"
															</c:if>
														>
														<label for="monthly_first" class="side-label">Day
														<input id="monthly_first_date" style="width: 40px; height:20px;" 
														class="i_text txt_time" type="text" 
															<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'm1')}">
																value="${fn:split(quartzInfo.pr_quar_expsn, ' ')[3]}"
															</c:if>
														/>
														of every
														<input id="monthly_first_month" style="width: 40px; height:20px;" 
														class="i_text txt_time" type="text" 
															<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'm1')}">
																value="${fn:split(fn:split(quartzInfo.pr_quar_expsn, '/')[1], ' ')[0]}"
															</c:if>
														/>
														month(s)
														</label><br/>
														
														<input id="monthly_second" name="how_monthly" type="radio" class="btn_time none"
															<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'm2')}">
																 checked="checked"
															</c:if>
														>
														<label for="monthly_second" class="side-label">The
														<select	style="width: 75px;" id="monthly_second_order" class="margin-bottom7">
															<option value="#1" 
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'm2')&&fn:contains(quartzInfo.pr_quar_expsn, '#1')}">
																		selected="selected"
																</c:if>
															>First</option>
															<option value="#2" 
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'm2')&&fn:contains(quartzInfo.pr_quar_expsn, '#2')}">
																		selected="selected"
																</c:if>
															>Second</option>
															<option value="#3" 
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'm2')&&fn:contains(quartzInfo.pr_quar_expsn, '#3')}">
																		selected="selected"
																</c:if>
															>Third</option>
															<option value="#4"
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'm2')&&fn:contains(quartzInfo.pr_quar_expsn, '#4')}">
																		selected="selected"
																</c:if>
															>Fourth</option>
														</select>	
														<select	style="width: 85px;" id="monthly_second_day" class="margin-bottom7">
															<option value="MON" 
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'm2')&&fn:contains(quartzInfo.pr_quar_expsn, 'MON')}">
																		selected="selected"
																</c:if>
															>Monday</option>
															<option value="TUE" 
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'm2')&&fn:contains(quartzInfo.pr_quar_expsn, 'TUE')}">
																		selected="selected"
																</c:if>
															>Tuesday</option>
															<option value="WED" 
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'm2')&&fn:contains(quartzInfo.pr_quar_expsn, 'WED')}">
																		selected="selected"
																</c:if>
															>Wednesday</option>
															<option value="THU" 
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'm2')&&fn:contains(quartzInfo.pr_quar_expsn, 'THU')}">
																		selected="selected"
																</c:if>
															>Thursday</option>
															<option value="FRI"
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'm2')&&fn:contains(quartzInfo.pr_quar_expsn, 'FRI')}">
																		selected="selected"
																</c:if>
															 >Friday</option>
															<option value="SAT"
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'm2')&&fn:contains(quartzInfo.pr_quar_expsn, 'SAT')}">
																		selected="selected"
																</c:if>
															 >Saturday</option>
															<option value="SUN" 
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'm2')&&fn:contains(quartzInfo.pr_quar_expsn, 'SUN')}">
																		selected="selected"
																</c:if>
															>Sunday</option>
														</select>
														of every
														<input id="monthly_second_month" style="width: 40px; height:20px;" 
														class="i_text txt_time" type="text" 
															<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'm2')}">
																value="${fn:split(fn:split(quartzInfo.pr_quar_expsn, '/')[1], ' ')[0]}"
															</c:if>
														/> 
														month(s)	
														</label>																			
													</div>
													<!--  yearly  -->
													<div id="yearly_area" class="area time_style"
														<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'y')}">
														style="display:block"
														</c:if>
													 >
														<input id="yearly_first" name="how_yearly" type="radio" class="btn_time none"
															<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'y1')}">
																checked="checked"
															</c:if>
														/>
														<label for="yearly_first" class="side-label">Every
														<select	style="width: 85px;" id="yearly_first_month" class="">
															<option value="1" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='1'}">
																		selected="selected"
																</c:if>
															>January</option>
															<option value="2" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='2'}">
																		selected="selected"
																</c:if>
															>February</option>
															<option value="3" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='3'}">
																		selected="selected"
																</c:if>
															>March</option>
															<option value="4" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='4'}">
																		selected="selected"
																</c:if>
															>April</option>
															<option value="5" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='5'}">
																		selected="selected"
																</c:if>	
															>May</option>
															<option value="6" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='6'}">
																		selected="selected"
																</c:if>
															>June</option>
															<option value="7" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='7'}">
																		selected="selected"
																</c:if>
															>July</option>
															<option value="8" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='8'}">
																		selected="selected"
																</c:if>
															>August</option>
															<option value="9" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='9'}">
																		selected="selected"
																</c:if>
															>September</option>
															<option value="10" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='10'}">
																		selected="selected"
																</c:if>
															>October</option>
															<option value="11" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='11'}">
																		selected="selected"
																</c:if>
															>November</option>
															<option value="12" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='12'}">
																		selected="selected"
																</c:if>
															>December</option>
														</select>
														<input id="yearly_first_date" style="width: 40px; height:20px;" 
														class="i_text txt_time" type="text"
															<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'y1')}">
																value="${fn:split(quartzInfo.pr_quar_expsn, ' ')[3]}"
															</c:if>
														/>
														</label><br/>
														
														<input id="yearly_second" name="how_yearly" type="radio" class="btn_time none"
															<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'y2')}">
																checked="checked"
															</c:if>
														/>
														<label for="yearly_second" class="side-label">The
														<select	style="width: 75px;" id="yearly_second_order" class="margin-bottom7">
															<option value="#1" 
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, '#1')}">
																		selected="selected"
																</c:if>
															>First</option>
															<option value="#2" 
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, '#2')}">
																		selected="selected"
																</c:if>
															>Second</option>
															<option value="#3"
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, '#3')}">
																		selected="selected"
																</c:if>
															 >Third</option>
															<option value="#4"
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, '#4')}">
																		selected="selected"
																</c:if>
															 >Fourth</option>
														</select>
														<select	style="width: 85px;" id="yearly_second_day" class="margin-bottom7">
															<option value="MON" 
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'MON')}">
																		selected="selected"
																</c:if>
															>Monday</option>
															<option value="TUE" 
															<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'TUE')}">
																		selected="selected"
																</c:if>
															>Tuesday</option>
															<option value="WED" 
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'WED')}">
																		selected="selected"
																</c:if>
															>Wednesday</option>
															<option value="THU" 
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'THU')}">
																		selected="selected"
																</c:if>
															>Thursday</option>
															<option value="FRI" 
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'FRI')}">
																		selected="selected"
																</c:if>
															>Friday</option>
															<option value="SAT" 
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'SAT')}">
																		selected="selected"
																</c:if>
															>Saturday</option>
															<option value="SUN" 
																<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'SUN')}">
																		selected="selected"
																</c:if>
															>Sunday</option>
														</select>
														of
														<select	style="width: 85px;" id="yearly_second_month" class="">
															<option value="1" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='1'}">
																		selected="selected"
																</c:if>
															>January</option>
															<option value="2" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='2'}">
																		selected="selected"
																</c:if>
															>February</option>
															<option value="3" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='3'}">
																		selected="selected"
																</c:if>
															>March</option>
															<option value="4" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='4'}">
																		selected="selected"
																</c:if>
															>April</option>
															<option value="5" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='5'}">
																		selected="selected"
																</c:if>
															>May</option>
															<option value="6" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='6'}">
																		selected="selected"
																</c:if>
															>June</option>
															<option value="7"
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='7'}">
																		selected="selected"
																</c:if>
															>July</option>
															<option value="8" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='8'}">
																		selected="selected"
																</c:if>
															>August</option>
															<option value="9" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='9'}">
																		selected="selected"
																</c:if>
															>September</option>
															<option value="10" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='10'}">
																		selected="selected"
																</c:if>
															>October</option>
															<option value="11" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='11'}">
																		selected="selected"
																</c:if>
															>November</option>
															<option value="12" 
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[4]=='12'}">
																		selected="selected"
																</c:if>
															>December</option>
														</select>
														</label>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td style="padding-left:40px"> 
											<input id="t_area" name="how_hour" type="radio" class="area btn_time none"
												<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, '_h2')}">
													 checked="checked"
												</c:if>
											/>	
											<label for="t_area" id="radio_start" class="side-label area none" 
												<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'h')}">
													style="display:block"
												</c:if>
											>Choose Time
											</label>
											<p id="start_time" class="area time_style" style="padding-top:0px;
											<c:choose>
												<c:when test="${fn:contains(quartzInfo.pr_quar_expsn, 'n')}">
													display:none;
												</c:when>
												<c:otherwise>
													display:block;
												</c:otherwise>
											</c:choose>
											">
											The	start time
												<select	style="width: 45px;" id="sel_hour" class="sel_time">
													<c:forEach var="i" begin="0" end="23" step="1">
														<c:choose>
															<c:when test="${!fn:contains(quartzInfo.pr_quar_expsn, 'n')&&!fn:contains(quartzInfo.pr_quar_expsn, 'h1')}">
																<option value="${i}"
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[2] eq i }">
																		selected="selected"
																</c:if> 
																>${i}</option>
															</c:when>
															<c:otherwise>
																<option value="${i}">${i}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select> 
												<select style="width: 45px;" id="sel_minute" class="sel_time">
													<c:forEach var="i" begin="0" end="59" step="1">
														<c:choose>
															<c:when test="${!fn:contains(quartzInfo.pr_quar_expsn, 'n')&&!fn:contains(quartzInfo.pr_quar_expsn, 'h1')}">
																<option value="${i}"
																<c:if test="${fn:split(quartzInfo.pr_quar_expsn, ' ')[1] eq i }">
																		selected="selected"
																</c:if> 
																>${i}</option>
															</c:when>
															<c:otherwise>
																<option value="${i}">${i}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
											
												</select>
												</p>
											</td>
										</tr>
										<tr>
											<td>
												<input id="btn_cron" type="radio" name="time_expression" class="none"
													<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'cr')}">
														 checked="checked"
													</c:if>
												> 
												<label for="btn_cron" class="side-label">
												Enter your cron expression</label>
												<input id="cron_txt" style="width: 200px;" class="i_text" type="text"
													<c:if test="${fn:contains(quartzInfo.pr_quar_expsn, 'cr')}">
														value="${fn:split(quartzInfo.pr_quar_expsn, '_')[1]}"
													</c:if>
												/>
											</td>
										</tr>															
									</table>
								</section>
                              <!-- 쿼츠 내용 쿼츠 내용쿼츠 내용 쿼츠 내용 쿼츠 내용 쿼츠 내용 쿼츠 내용-->
                              </div>
                            </div>
                        </div>
					</td>
				</tr>   <!-- 쿼츠 tr end-->
			</table>
		</div>
		<div class="btn-area">
			<div class="btn-left">
				<button class="btnLeft"></button>
			</div>
			<div class="btn-right">
				<button class="btnRight"></button>
			</div>
		</div>
		</div>
	</section>
	</form>
</body>
</html>