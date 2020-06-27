package pl.coderslab.charity.formatter;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repositories.InstitutionRepository;

@Component
public class InstitutionConverter implements Converter<String, Institution> {

    private InstitutionRepository institutionRepository;


    @Override
    public Institution convert(String s) {
        return institutionRepository.findById(Long.parseLong(s)).get();
    }
}
