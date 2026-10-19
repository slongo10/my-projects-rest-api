export class ApiError extends Error {
  constructor(status, code, message, details = []) {
    super(message)
    this.name = 'ApiError'
    this.status = status
    this.code = code
    this.detail = details
  }
}

export function isApiError(error) {
  return error instanceof ApiError
}
