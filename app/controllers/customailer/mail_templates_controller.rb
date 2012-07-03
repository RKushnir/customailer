module Customailer
  class MailTemplatesController < ApplicationController
    # GET /mail_templates
    # GET /mail_templates.json
    def index
      @mail_templates = MailTemplate.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @mail_templates }
      end
    end

    # GET /mail_templates/1
    # GET /mail_templates/1.json
    def show
      @mail_template = MailTemplate.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @mail_template }
      end
    end

    # GET /mail_templates/new
    # GET /mail_templates/new.json
    def new
      @mail_template = MailTemplate.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @mail_template }
      end
    end

    # GET /mail_templates/1/edit
    def edit
      @mail_template = MailTemplate.find(params[:id])
    end

    # POST /mail_templates
    # POST /mail_templates.json
    def create
      @mail_template = MailTemplate.new(mail_template_params)

      respond_to do |format|
        if @mail_template.save
          format.html { redirect_to @mail_template, notice: 'Mail template was successfully created.' }
          format.json { render json: @mail_template, status: :created, location: @mail_template }
        else
          format.html { render action: "new" }
          format.json { render json: @mail_template.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /mail_templates/1
    # PUT /mail_templates/1.json
    def update
      @mail_template = MailTemplate.find(params[:id])

      respond_to do |format|
        if @mail_template.update_attributes(mail_template_params)
          format.html { redirect_to @mail_template, notice: 'Mail template was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @mail_template.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /mail_templates/1
    # DELETE /mail_templates/1.json
    def destroy
      @mail_template = MailTemplate.find(params[:id])
      @mail_template.destroy

      respond_to do |format|
        format.html { redirect_to mail_templates_url }
        format.json { head :no_content }
      end
    end

    private

    def mail_template_params
      params[:mail_template].slice(:body, :path, :locale).
                            merge(format: 'html', handler: 'liquid')
    end
  end
end
