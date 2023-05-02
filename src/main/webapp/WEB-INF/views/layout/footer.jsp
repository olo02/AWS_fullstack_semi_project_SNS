<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
            <!-- Footer Start -->
			<div class="container-fluid footer mt-auto" style="padding-top:300px;">
				<div class="rounded-top p-4">
					<div class="row">
						<div class="col-12 col-sm-6 text-center text-sm-start">
							&copy; DamSo. 담소, All Right Reserved.
						</div>
						<div class="col-12 col-sm-6 text-center text-sm-end">
							<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
							Designed By <a href="https://htmlcodex.com">HTML Codex</a>
						</div>
					</div>
				</div>
			</div>            
            <!-- Footer End -->
        </div>
        <!-- Content End -->


	<%-- 글 상세 --%>
	<!-- 댓글 작성 모달 -->

<%-- 글 상세 --%>
<!-- 댓글 작성 모달 -->
<div class="modal fade" id="boardModal" tabindex="-1"
	 role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg"
		 role="document">
		<div class="modal-content" style="flex-direction: row; flex-wrap: wrap; border-radius: 10px;">
			<div class="col-12" style="height:38px">
				<a>
					<i class="fas fa-arrow-left float-start pt-2" style="font-size: 22px; padding-left:10px"></i>
				</a>
			</div>
			<div class="col-7" style="height : 587.5px">
				<img id="detailImage" class="img-fluid" src=""
					 alt="Image" style="width: auto; height: 100%; max-height: 587.5px; object-fit: cover">
			</div>
			<div class="col-5">
				<div class="media p-3">
					<div class="d-flex boardWriterAttach">
						<a href="">
							<img class="write-img" src="">
						</a>
					</div>
					<div class="media-body" style="padding-top: 2px;">
						<span class="" id="writer"></span>
						<div class="write-option" style="border-bottom: 0">
							<span class=" float-start pt-1 ps-3" id="content"></span>
						</div>
					</div>
				</div>
				<div class="modalscroll" style="position: relative; height: 412.109px;">
					<ul class="list-group chat">
					</ul>
					<a class="icn-more" style="position: absolute; right: 0; padding: 10px 25px"><i class="fas fa-plus-circle"></i></a>
				</div>
				<div class="modal-footer" id="modalFooter" >
					<form name="replyform" class="row w-100">
						<input type="hidden" name="writer" value="${member.email}">
						<input type="hidden" name="bno" value="">
						<input type="hidden" name="rno" value="">
						<div class="input-group">
							<input type="text" class="modal-reply-add form-control" name="content" placeholder="댓글 달기..">
							<button class="btn btn-link" >등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>



	<!-- 글 삭제, 수정, 취소 모달 -->
	<div class="modal fade" id="editModal" tabindex="-1"
		 role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" style="width: 400px;"
			 role="document">
			<div class="modal-content" style="flex-direction: row; flex-wrap: wrap; border-radius: 10px;">
				<div class="col-12">
					<div id="remove" class="write-option text-center d-flex align-items-center justify-content-center" style="height: 50px">
						<span class="text-danger">삭제</span>
					</div>
					<div id="modify" class="write-option text-center d-flex align-items-center justify-content-center" style="height: 50px">
						<span>수정</span>
					</div>
					<div class="write-option text-center d-flex align-items-center justify-content-center" style="height: 50px">
						<span>취소</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 글 삭제 모달 -->
	<div class="modal fade" id="removeModal" tabindex="-1"
		 role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" style="width: 400px;"
			 role="document">
			<div class="modal-content" style="flex-direction: row; flex-wrap: wrap; border-radius: 10px;">
				<div class="col-12">
					<div class="write-option text-center d-flex align-items-center justify-content-center" style="height: 50px">
						<span class="text-danger">정말 삭제하시겠습니까?</span>
					</div>
					<div class="write-option text-center d-flex align-items-center justify-content-center" style="height: 50px">
						<span>확인</span>
					</div>
					<div class="write-option text-center d-flex align-items-center justify-content-center" style="height: 50px">
						<span>취소</span>
					</div>
				</div>
			</div>
		</div>
	</div>
        

        <!-- Back to Top -->
        <a href="#" class="btn bg-light rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/lib/tempusdominus/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath }/resources/js/main_230404.js"></script>
</body>

</html>