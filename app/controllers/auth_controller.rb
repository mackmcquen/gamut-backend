class AuthController < ApplicationController
    
    def create
        # Check if user exists in database
        # If user exists:
        #   Check if password hash in the database matches password user entered
        #       If true:
        #           Return the user
        #       Else:
        #           Send error to the Front End
        
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            payload = { user_id: user.id }
            secret = 's3cret!'
            token = JWT.encode(payload, secret, 'HS256')
            
            render json: { id: user.id, email: user.email, username: user.username, token: token }
        else
            render json: { error: 'Invalid Username or Password' }, status: 401
        end
    end

    def show
        token = request.headers['Authorization'].split(' ').last
        decoded_token = JWT.decode(token, 's3cret!', true, { algorithm: 'HS256' })
        id = decoded_token.first[ 'user_id' ]

        user = User.find(id)
        if user
            render json: { id: user.id, username: user.username, token: token }
        else
            render json: { error: 'Invalid token' }
        end
    end
end