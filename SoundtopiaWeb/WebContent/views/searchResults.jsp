<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
<jsp:include page="headers.jsp" />
<jsp:include page="navi.jsp" />
<jsp:include page="modals.jsp" />

<div id="content">
<c:forEach var="chart" items="${chartList}">
		<div class="content_item">
			<div class="chartplatzierung">
			<!-- <div class="chartState">
					<c:choose>
						<c:when test="${chart.change > '0'}">
							<img class="up" src="../images/up.png">
							<span class="chartStateUp">${chart.change}</span>
						</c:when>
						<c:when test="${chart.change < '0' }">
							<img class="down" src="../images/down.png">
							<span class="chartStateDown">${chart.change}</span>
						</c:when>
						<c:when test="${chart.change == '0' }">
							<img class="equal" src="../images/equal.png">
							<span class="chartStateEqual"></span>
						</c:when>
						<c:otherwise>
							<img class="new" src="../images/new.png">
							<span class="chartStateNew">Neu</span>
						</c:otherwise>
					</c:choose>
				</div> -->
				<span class="platznummer">${chart.ranking}.</span> <span
					class="platz">Platz</span>
			</div>
			<c:choose>
				<c:when test="${sessionScope.user.admin == 1 }">
					<a class="modalInput" onclick="javascript:fillText('${chart.id}');"
						rel="#modalEdit" href="javascript:void(0);"> <img class="edit"
						src="../images/edit.png" />
					</a>
					<a onclick="javascript:setUndoID('${chart.id}')" class="modalInput"
						rel="#modalUndo" href="javascript:void(0);"> <img class="undo"
						src="../images/undo.png" />
					</a>
				</c:when>
			</c:choose>
			<div class="chartbild">
				<img id="cover${chart.id}" class="cover"
					alt="Coverlink:${chart.picture}" src="${chart.picture}" />
			</div>
			<div class="kasten">
				<div id="chartautor${chart.id}" class="chartautor">${chart.interpreter}</div>
				<span class="platzhalter_autor_name"> | </span>
				<div id="chartname${chart.id}" class="chartname">${chart.title}</div>
				<div id="chartpreise${chart.id}" class="chartpreise">
					<c:forEach var="price" items="${chart.prices}">
						<div class="chartpreis">
							<a target="_blank" href="${price.url}"><img class="resize"
								src="../images/${price.provider}_resize.png" /></a>
							<div class="chartpreis_preis">
								<a target="_blank" href="${price.url}"><fmt:formatNumber pattern="0.00" type="number" value="${price.value}" />
									${price.currency}</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="chartbewertung">
					<form>
						Bewertung: &oslash;
						<c:choose>
							<c:when test="${sessionScope.loggedIn  == false}">
								<br>
								<div id="fake-stars-off${chart.ranking}" class="stars-off"
									style="width: 81px;">
									<div id="fake-stars-on${chart.ranking}" class="stars-on"></div>
								</div>
								<script>
									rateFake('${chart.ranking}',
											'${chart.rating}');
								</script>
							</c:when>
							<c:otherwise>
								<div class="stars-wrapper" id="stars-wrapper${chart.ranking}">
									<select name="selrate">
										<option value="1">Very poor</option>
										<option value="2">Not that bad</option>
										<option value="3">Average</option>
										<option value="4">Good</option>
										<option value="5">Perfect</option>
									</select>
								</div>
								<script>
									showStars('${chart.ranking}', '${chart.id}');
									rate('${chart.ranking}',
											'${chart.userRating}');
								</script>
							</c:otherwise>
						</c:choose>
					</form>
				</div>
				<div id="chartstars${chart.ranking}" class="chartstars"><fmt:formatNumber pattern="0.00" type="number" value="${chart.rating}" /></div>

				<div class="chartlaenge">Trackl&auml;nge:
					${chart.tracklength}min</div>
				<!-- <div class="chartplayer">Play | Stop | Volume</div> -->
				<div class="chart_extend"></div>
			</div>
			<div class="kasten_extended">
				<div class="chartvideo">
					<object style='width: 301px; height: 200px;' width='301'
						height='200'>
						<embed src='${chart.video }' width='301' height='200'
							type='application/x-shockwave-flash' allowscriptaccess='always'
							allowfullscreen='true'>
						</embed>
						<param name='movie' value='${chart.video}' />
						<param name='AllowFullscreen' value='true' />
						<param name='AllowScriptAccess' value='always' />
					</object>
				</div>
				<div class="chartlyrik">
					Lyrik
					<div id="lyriktext${chart.id}" class="lyriktext">
						${chart.lyric.text}<br> <br> <a target="_blank"
							href="${chart.lyric.url}">${chart.interpreter} -
							${chart.title}</a>
					</div>
				</div>
				<!-- Lyrik Ende -->
			</div>
			<!-- Kasten Extended Ende -->
		</div>
		<!--  Content_Item Ende -->
	</c:forEach>

</div>
<!-- Content Ende -->
<div id="footer">
	<div id="platzierungen">
	</div>
</div>
<!-- Footer Ende -->
</div>
<!-- Main Ende -->
</body>
</html>