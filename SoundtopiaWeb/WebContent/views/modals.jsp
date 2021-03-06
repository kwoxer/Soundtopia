<div class="modal" id="modalRegister">
<a class="close myClose"></a>
	<form id="validRegistrationForm" name="validRegistrationForm"
		action="../controller/register" Method="post">
		<fieldset>
			<legend>Registration</legend>
			<table>
				<tr>
					<td><label>E-Mail Adresse</label></td>
					<td><input type="text" name="emailR" /></td>
					<td></td>
				</tr>
				<tr>
					<td><label>Kennwort</label></td>
					<td><input type="password" name="passwordR" id="passwordR" /></td>
					<td></td>
				</tr>
				<tr>
					<td><label>Kennwort&uuml;berpr&uuml;fung</label></td>
					<td><input type="password" name="checkR" /></td>
					<td></td>
				</tr>
				<tr>
					<td id="terms"><label>Adminrechte</label></td>
					<td><input type="checkbox" name="adminR" /></td>
					<td></td>
				</tr>
				<tr>
					<td>
						<!-- <button type="submit">Submit form</button>
						<button type="reset">Reset</button>
						--> <input type="image"
						onclick="$('#validRegistrationForm').valid()"
						src="../images/enter.jpg" />
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
	<a class="close"></a>
</div>

<div id="modalUndo" class="modal">
	<input id="undoID" name="undoID" type="text" style="display: none" />
	<span>M�chten Sie wirklich alle �nderungen r�ckg�ngig machen?</span>
	<div id="undoButtons" class="modalButtons">
		<img class="button" onclick="javascript:undoChanges();"
			src="../images/yes.jpg" />&nbsp;<img id="closeUndoChanges"
			class="close button" src="../images/no.jpg" />
	</div>
	<img id="loadingUndo" class="loading" src="../images/loading.gif" />
</div>

<div id="modalNew" class="modal">
	<span id="modalNewTxt">M�chten Sie wirklich die neusten Charts
		manuell laden?</span>
	<div id="newButtons" class="modalButtons">
		<img class="button" onclick="javascript:readCharts();"
			src="../images/yes.jpg" />&nbsp;<img id="closeNewChanges"
			class="close button" src="../images/no.jpg" />
	</div>
	<img id="loadingNew" class="loading" src="../images/loading.gif" />
</div>

<div id="modalEdit" class="songAddition modal">
	<a id="closeEdit" class="close myClose"></a>
	<form action="javascript:void(0);"
		onsubmit="javascript:changeSongInformation();" method="post">
		<input id="txtID" name="txtID" type="text" style="display: none" />
		<input id="txtIndex" name="txtIndex" type="text" style="display: none" />
		<div class="songAdditionInterpreter">
			Interpreter<br> <input id="txtInterpreter" name="txtInterpreter"
				type="text" />
		</div>
		<div class="songAdditionTitle">
			Title<br> <input id="txtTitle" name="txtTitle" type="text" /><br>
			<br>
		</div>
		<div class="songAdditionCover">
			Cover<br> <input id="txtCover" name="txtCover" type="text"
				onChange="javascript:changePreview(this.value)" /> <img
				id="editPreviewSmall" onmouseout="javascript:hidePreview();"
				onmouseover="javascript:showPreview();" /><br> <select
				id="txtAPI" name="editAPI">
				<option>Google Picture API</option>
				<option>Amazon API</option>
			</select> <input onclick="javascript:getURLfromAPI();" id="enterAPI"
				type="button">
		</div>
		<img id="loadingEdit" class="loading" src="../images/loading.gif" />
		<input id="saveEdit" src="../images/save.jpg" type="image" />
		<button style="display: none" type="reset" id="closeModalEdit"
			class="close">Abbrechen</button>
	</form>
	<img id="editPreview" />
</div>