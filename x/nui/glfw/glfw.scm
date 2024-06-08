(define-module (glfw))

(use-modules (glfw ffi))

(define-public (glfw-init-with thunk)
  (dynamic-wind
    (λ () (unless (= GLFW_TRUE (glfwInit)) (error "glfwInit failed")))
    thunk
    glfwTerminate))
