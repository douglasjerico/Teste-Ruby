listNames = "John Doe, Peter Párker, Mary Jane Watson-Parker, James Doe, John Elvis Doe, Jane Doe, Penny Parker"
domain = "company.com"

def remove_accents(input_str)
    return input_str
        .tr(
            "ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħÌÍÎÏìíîïĨĩĪīĬĭĮįİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓÔÕÖØòóôõöøŌōŎŏŐőŔŕŖŗŘřŚśŜŝŞşŠšſŢţŤťŦŧÙÚÛÜùúûüŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸŹźŻżŽž",
            "AAAAAAaaaaaaAaAaAaCcCcCcCcCcDdDdDdEEEEeeeeEeEeEeEeEeGgGgGgGgHhHhIIIIiiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnNnNnnNnOOOOOOooooooOoOoOoRrRrRrSsSsSsSssTtTtTtUUUUuuuuUuUuUuUuUuUuWwYyyYyYZzZzZz"
        )
        .tr('#@$%&/\|', '')
end

def get_email_by_name(name)
    eachName = remove_accents(name).strip.downcase.tr('-', '').split(' ')
    email = eachName.last
    i = 0;

    while i < eachName.length() - 1
        email << "." + eachName.at(i).split('').first

        i = i + 1
    end

    return email
end

def get_list_email_complete(listNames, domain)
    listEmailsWithoutDomain = listNames.split(',').map { |name| get_email_by_name(name) }
    listEmailUnique = [];

    listEmailsWithoutDomain.each do |email| 
        if !listEmailUnique.include?(email)
            listEmailUnique.push(email)

            next
        end

        i = 2

        while true
            if !listEmailUnique.include?(email + i.to_s)
                listEmailUnique.push(email + i.to_s)
    
                break
            end

            i = i + 1
        end
    end

    return listEmailUnique.map { |email| email + "@" + domain }
end

def show_names_email(listNames, listEmails)
    listNames = listNames.split(',')
    namesWithEmails = ""
    i = 0;

    while i < listNames.length() -1
        namesWithEmails << listNames.at(i) + " " + listEmails.at(i) + ","

        i = i + 1
    end

    puts namesWithEmails.chop
end

listEmails = get_list_email_complete(listNames, domain)

show_names_email(listNames, listEmails)