{include 'components/field/field.file.tpl'
    name          = "property[{$property->getId()}][file]"
    removeName    = "property[{$property->getId()}][remove]"
    classes       = 'width-300'
    note          = $property->getDescription()
    label         = $property->getTitle()
    uploadedFiles = $property->getValue()->getDataOne( 'file' )}