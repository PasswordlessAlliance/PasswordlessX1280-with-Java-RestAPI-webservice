<!-- Accordion -->
<div class="accordion">
	<div class="accordion-overview">
		<h5>Passwordless X1280</h5>
		<h3>Demo User Guide</h3>
	</div>

	<div class="accordion-item">
		<button class="accordion-header">
			<span><em>1</em></span>Create Account
		</button>
		<div class="accordion-content">
			<h5>Create your Passwordless X1280 demo account</h5>
			<p>On the "Passwordless X1280 Login" modal, click the "Create Account" link on the bottom left. Then, enter your desired ID, password, and click the "Create Account" button to generate your demo account.</p>
			<div class="content-details between">
				<div>
					<img src="/image/1_1_create_account_link.jpg" alt="Create Account Link"/>
				</div>
				<div>
					<img src="/image/1_2_create_account_confirm.jpg" alt="Create Account Confirm"/>
				</div>
			</div>
		</div>
	</div>
	<div class="accordion-item">
		<button class="accordion-header">
			<span><em>2</em></span>Download the Mobile App
		</button>
		<div class="accordion-content">
			<h5>Download and Install Passwordless X1280 Mobile App</h5>
			<p>Download the "Passwordless X1280" mobile application on your smartphone.</p>
			<div class="content-details">
				<div class="w30 bt20">
					<img src="/image/app_apple_icon.png" alt="Download Apple App Store"/>
					<img src="/image/app_apple_qr.png" alt="Apple App Store QR"/>
				</div>
				<div class="w30 bt20">
					<img src="/image/app_google_icon.png" alt="Get it on Google Play"/>
					<img src="/image/app_google_qr.png" alt="Google Play QR"/>
				</div>
			</div>
		</div>
	</div>
	<div class="accordion-item">
		<button class="accordion-header">
			<span><em>3</em></span> Register for the Passwordless service
		</button>
		<div class="accordion-content">
			<h5>Register for the Passwordless service on the web server</h5>
			<p>On the "Passwordless X1280 Login" modal, select the "Passwordless" radio button, and click the "Passwordless Reg/Unreg" link at the bottom right. Then, enter your ID, password, and click the "Passwordless Reg/Unreg" button to register for the Passwordless service.</p>
			<div class="content-details between">
				<div>
					<img src="/image/3_1_passwordless_reg_link.jpg" alt="Paswordless Registration Link"/>
				</div>
				<div>
					<img src="/image/3_2_passwordless_reg_confirm.jpg" alt="Paswordless Registration Confirm"/>
				</div>
			</div>
		</div>
	</div>
	<div class="accordion-item">
		<button class="accordion-header">
			<span><em>4</em></span> Register the Passwordless service on the Mobile App
		</button>
		<div class="accordion-content">
			<h5>Register the Passwordless service via QR code</h5>
			<p>After you have registered on the web server, you will see a QR code pop-up asking to register the Passwordless service on your smartphone.</p>
			<h5>Add the Passwordless service to your smartphone</h5>
			<p>Run "Passwordless X1280" mobile app, and click the "+" button top right corner on your smartphone. Then, scan the QR Code to add the Passwordless service to your smartphone.</p>
			<div class="content-details">
				<div class="w40">
					<img src="/image/4_1_regiser_qr.jpg" alt="Passwordless Registration Mobile QR Scan"/>
				</div>
			</div>
		</div>
	</div>
	<div class="accordion-item">
		<button class="accordion-header">
			<span><em>5</em></span> Passwordless Login
		</button>
		<div class="accordion-content">
			<h5>Automatic Password Login</h5>
			<p>Go to "Passwordless X1280 Login" modal. Select the "Passwordless" radio button, and click the "Login" button. The web server will request to confirm a 6-digit Automatic password.</p>
			<p>Click the "Approve" button on your "Passwordless X1280" smartphone app, and the demo site will log in automatically.</p>
			<div class="content-details">
				<div class="w60">
					<img src="/image/5_1_passwordless_login_desktop.jpg" alt="Passwordless Login Desktop"/>
				</div>
				<div class="w40">
					<img src="/image/5_2_passwordless_login_mobile.jpg" alt="Passwordless Login Mobile"/>
				</div>
			</div>
		</div>
	</div>
	
</div>

<script>
	var input = document.getElementById("id");
	input.addEventListener("keyup", function (event) {
		if (event.keyCode === 13) {
			event.preventDefault();
			login();
		}
	});

	var input = document.getElementById("pw");
	input.addEventListener("keyup", function (event) {
		if (event.keyCode === 13) {
			event.preventDefault();
			login();
		}
	});

//accordion 
const headers = document.querySelectorAll('.accordion-header');

// 열기 함수
function openAccordion(header, content) {
  content.style.maxHeight = content.scrollHeight + "px";
  content.classList.add('open');
  header.classList.add('open');
}

// 닫기 함수
function closeAccordion(header, content) {
  content.style.maxHeight = null;
  content.classList.remove('open');
  header.classList.remove('open');
}

// 클릭 이벤트 등록
headers.forEach(header => {
  header.addEventListener('click', () => {
    const content = header.nextElementSibling;

    // 다른 섹션 닫기
    document.querySelectorAll('.accordion-content').forEach((c, i) => {
      const h = headers[i];
      if (c !== content) {
        closeAccordion(h, c);
      }
    });

    // 현재 섹션 토글
    if (content.classList.contains('open')) {
      closeAccordion(header, content);
    } else {
      openAccordion(header, content);
    }
  });
});

// 첫 번째 항목 자동 열기
/*
window.addEventListener('DOMContentLoaded', () => {
  const firstHeader = document.querySelector('.accordion-header');
  const firstContent = document.querySelector('.accordion-content');
  if (firstHeader && firstContent) {
    openAccordion(firstHeader, firstContent);
  }
});
*/
</script>