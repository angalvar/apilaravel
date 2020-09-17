<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class SecurityApi
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if (!($request->api_token == env('API_TOKEN'))) {
            return response("Error");
        }
        return $next($request);
    }
}
