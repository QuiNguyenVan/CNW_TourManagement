document.addEventListener('DOMContentLoaded', function() {
    
    // 1. Highlight menu đang active (Tùy chọn)
    const currentPath = window.location.pathname;
    const navLinks = document.querySelectorAll('.nav-menu a');
    navLinks.forEach(link => {
        if (link.href.includes(currentPath) && currentPath !== '/') {
            link.style.color = 'var(--primary)';
            link.style.fontWeight = 'bold';
        }
    });

    // 2. Xử lý form submit: Ngăn chặn click nhiều lần (Double Submit Prevention)
    const forms = document.querySelectorAll('form');
    forms.forEach(form => {
        form.addEventListener('submit', function(e) {
            const submitBtn = form.querySelector('input[type="submit"], button[type="submit"]');
            if (submitBtn) {
                // Nếu form hợp lệ, disable nút để tránh click đúp
                if (form.checkValidity()) {
                    submitBtn.value = "Đang xử lý...";
                    submitBtn.disabled = true;
                    submitBtn.style.opacity = "0.7";
                    submitBtn.style.cursor = "wait";
                }
            }
        });
    });

    // 3. Validation đơn giản cho giá tiền (nếu có trường price)
    const priceInput = document.querySelector('input[name="price"]');
    if (priceInput) {
        priceInput.addEventListener('input', function() {
            if (this.value < 0) {
                alert("Giá tiền không được âm!");
                this.value = "";
            }
        });
    }
});

// Hàm xác nhận xóa (đã dùng inline trong JSP, nhưng giữ ở đây để tái sử dụng nếu cần)
function confirmDelete() {
    return confirm("Bạn có chắc chắn muốn xóa dữ liệu này không? Hành động này không thể hoàn tác.");
}