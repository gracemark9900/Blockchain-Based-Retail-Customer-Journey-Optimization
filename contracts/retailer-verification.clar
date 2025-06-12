;; Retailer Verification Contract
;; Validates and stores retail business information

;; Define data variables
(define-data-var admin principal tx-sender)
(define-map retailers principal
  {
    name: (string-utf8 100),
    verified: bool,
    verification-date: uint,
    industry: (string-utf8 50),
    active: bool
  }
)

;; Public functions
(define-public (register-retailer (name (string-utf8 100)) (industry (string-utf8 50)))
  (let ((caller tx-sender))
    (if (is-retailer caller)
        (err u1) ;; Already registered
        (begin
          (map-set retailers caller {
            name: name,
            verified: false,
            verification-date: u0,
            industry: industry,
            active: true
          })
          (ok true)))))

(define-public (verify-retailer (retailer principal))
  (let ((caller tx-sender))
    (if (is-eq caller (var-get admin))
        (match (map-get? retailers retailer)
          retailer-data (begin
            (map-set retailers retailer
              (merge retailer-data {
                verified: true,
                verification-date: block-height
              }))
            (ok true))
          (err u2)) ;; Retailer not found
        (err u3)))) ;; Not authorized

(define-public (deactivate-retailer)
  (let ((caller tx-sender))
    (match (map-get? retailers caller)
      retailer-data (begin
        (map-set retailers caller
          (merge retailer-data { active: false }))
        (ok true))
      (err u4)))) ;; Retailer not found

;; Read-only functions
(define-read-only (is-retailer (address principal))
  (is-some (map-get? retailers address)))

(define-read-only (is-verified-retailer (address principal))
  (match (map-get? retailers address)
    retailer-data (get verified retailer-data)
    false))

(define-read-only (get-retailer-info (address principal))
  (map-get? retailers address))

;; Admin functions
(define-public (set-admin (new-admin principal))
  (let ((caller tx-sender))
    (if (is-eq caller (var-get admin))
        (begin
          (var-set admin new-admin)
          (ok true))
        (err u5)))) ;; Not authorized
